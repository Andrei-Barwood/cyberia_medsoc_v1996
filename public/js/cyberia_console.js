/* ==========================================================================
   CYBERIA-MED // SOC Console v19.96 — Main Frontend & Aegis9 Sentinel Controller
   Handles:
   1. Live HTML5 Canvas ECG Waveform (#00F200 / #30FF00)
   2. 48-Episode Filtering (Act I-VI, Clinical Protocol, Instant Search)
   3. Dynamic Fetch of Episode Spoiler & 4 Clinical Pillars
   4. Interactive CLI Playbook Execution & Topology Sector Highlighting
   5. Live Reaction & Debugging by Native Sentinel Aegis9CyberbrainEDR,
      showing deployed patches in exact deployment order classified by:
      PREVENCIÓN, DETECCIÓN, MITIGACIÓN, and INCIDENT RESPONSE.
   ========================================================================== */

let activePatchCategoryFilter = 'all';
let cachedCumulativePatches = [];

document.addEventListener('DOMContentLoaded', () => {
  initEcgWaveform();
  initEpisodeNavigator();
  initPlaybookExecutor();
  initTopologyMap();
  initAegis9SentinelControls();
  triggerSentinelDebug(1);
});

/* 1. Monitor de Signos Vitales ECG en tiempo real (#00F200) */
function initEcgWaveform() {
  const canvas = document.getElementById('blades-ecg-canvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  const width = canvas.width;
  const height = canvas.height;
  let x = 0;

  const pqrstPattern = [
    0, 0, 0, -2, -4, -1, 0, 2, -13, 14, -4, 0, 0, -3, -6, -5, -2, 0, 0, 0, 0, 0
  ];
  let patternIdx = 0;
  let prevY = height / 2;

  ctx.fillStyle = '#093534';
  ctx.fillRect(0, 0, width, height);

  setInterval(() => {
    ctx.fillStyle = 'rgba(9, 53, 52, 0.14)';
    ctx.fillRect(0, 0, width, height);

    const nextX = (x + 2) % width;
    const offset = pqrstPattern[patternIdx];
    patternIdx = (patternIdx + 1) % pqrstPattern.length;
    const nextY = Math.max(3, Math.min(height - 3, (height / 2) + offset));

    if (nextX < x) {
      x = 0;
    }

    ctx.beginPath();
    ctx.strokeStyle = '#00F200';
    ctx.lineWidth = 1.8;
    ctx.shadowColor = '#30FF00';
    ctx.shadowBlur = 6;
    ctx.moveTo(x, prevY);
    ctx.lineTo(nextX, nextY);
    ctx.stroke();

    x = nextX;
    prevY = nextY;
  }, 45);
}

/* 2. Navegador de los 48 Episodios y Buscador SIEM */
function initEpisodeNavigator() {
  const searchInput = document.getElementById('soc-search-input');
  const actSelect = document.getElementById('soc-act-select');
  const protoSelect = document.getElementById('soc-protocol-select');
  const cards = Array.from(document.querySelectorAll('.episode-card-item'));
  const counterBadge = document.getElementById('episode-counter-badge');

  if (!cards.length) return;

  function applyFilters() {
    const q = (searchInput ? searchInput.value : '').toLowerCase().trim();
    const act = actSelect ? actSelect.value : 'all';
    const proto = (protoSelect ? protoSelect.value : 'all').toLowerCase();

    let visibleCount = 0;
    cards.forEach((card) => {
      const cardAct = card.getAttribute('data-act');
      const cardProto = (card.getAttribute('data-protocol') || '').toLowerCase();
      const cardSearch = card.getAttribute('data-search') || '';

      const matchAct = act === 'all' || cardAct === act;
      const matchProto = proto === 'all' || cardProto.includes(proto);
      const matchQuery = !q || cardSearch.includes(q);

      if (matchAct && matchProto && matchQuery) {
        card.style.display = '';
        visibleCount += 1;
      } else {
        card.style.display = 'none';
      }
    });

    if (counterBadge) {
      counterBadge.textContent = `${visibleCount} / 48`;
    }
  }

  if (searchInput) searchInput.addEventListener('input', applyFilters);
  if (actSelect) actSelect.addEventListener('change', applyFilters);
  if (protoSelect) protoSelect.addEventListener('change', applyFilters);

  cards.forEach((card) => {
    card.addEventListener('click', () => {
      cards.forEach((c) => c.classList.remove('active'));
      card.classList.add('active');
      const epId = card.getAttribute('data-ep-id');
      loadEpisodeIntoHud(epId);
    });
  });
}

/* 3. Carga Dinámica de Episodio en el Visor Central BLADES + Reacción del Sentinela Aegis-9 */
async function loadEpisodeIntoHud(epId) {
  try {
    const res = await fetch(`/api/episodes/${epId}`);
    if (!res.ok) return;
    const ep = await res.json();

    const v = (ep.pillars && ep.pillars.vulnerability) || {};
    const d = (ep.pillars && ep.pillars.detection) || {};
    const m = (ep.pillars && ep.pillars.mitigation) || {};
    const p = (ep.pillars && ep.pillars.prevention) || {};

    setText('viewer-header-title', `VISOR BLADES DPI & MRI // ${ep.code} — ${ep.game_node_code}`);
    setText('ep-badge-code', ep.code);
    setText('ep-badge-node', `NODO JUEGO: ${ep.game_node_code}`);
    setText('ep-badge-protocol', `PROTOCOLO: ${ep.clinical_protocol}`);
    setText('ep-badge-mitre', ep.mitre_technique);
    setText('ep-main-title', ep.title);
    setText('ep-act-name', ep.act);
    setText('ep-game-location', ep.game_location);
    setText('ep-hospital-counterpart', ep.hospital_counterpart);
    setText('ep-spoiler-text', ep.cyberia_spoiler);
    setText('ep-iomt-asset', ep.iomt_asset);

    setText('pillar-cve-badge', `${v.cve} (CVSS ${v.cvss})`);
    setText('pillar-cvss-vector', v.vector);
    setText('pillar-vuln-desc', v.description);

    setText('pillar-det-engine', d.engine);
    setText('pillar-det-rule', d.rule_name);
    setText('pillar-det-sig', d.signature);
    setText('pillar-det-indicator', d.telemetry_indicator);

    setText('pillar-mit-code', m.action_code);
    setText('pillar-mit-resp', m.immediate_response);
    setText('pillar-mit-cli', m.cli_command);

    setText('pillar-prev-std', p.standard);
    setText('pillar-prev-hardening', p.hardening_policy);
    setText('pillar-prev-zt', p.zero_trust_control);

    const exportMd = document.getElementById('btn-export-md');
    const exportJson = document.getElementById('btn-export-json');
    if (exportMd) exportMd.href = `/reports/episode/${ep.id}.md`;
    if (exportJson) exportJson.href = `/reports/episode/${ep.id}.json`;

    highlightTopologySector(ep.act_number);

    const term = document.getElementById('blades-live-terminal');
    if (term) {
      term.textContent = `[BLADES-SCAN ${ep.code}] Nodo '${ep.game_node_code}' cargado | Activo IoMT: ${ep.iomt_asset}\n` +
                         `[SIEM-ALERT] Detectado ${v.cve} (CVSS ${v.cvss}) -> Notificando al Sentinela Aegis9CyberbrainEDR...`;
    }

    // El Sentinela Aegis9CyberbrainEDR reacciona automáticamente a cada episodio que ocurre
    await triggerSentinelDebug(ep.id);
  } catch (err) {
    console.error('Error loading episode telemetry:', err);
  }
}

/* 4. Reacción y Depuración en Vivo del Sentinela Aegis9CyberbrainEDR */
async function triggerSentinelDebug(epId, verifyBinary = false) {
  const panel = document.getElementById('aegis9-sentinel-panel');
  if (!panel) return;

  try {
    const res = await fetch(`/api/sentinel/debug/${epId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ verify_binary: verifyBinary })
    });
    if (!res.ok) return;
    const data = await res.json();
    const s = data.session;

    setText('sentinel-binary-path', data.binary_path);
    setText('sentinel-active-sensor', s.aegis9_sensor);
    setText('sentinel-ghost-score', `${s.ghost_sync_before}% -> ${s.ghost_sync_after}% [NOMINAL]`);
    setText('sentinel-ledger-count', `${s.ledger_block_index} BLOQUES`);
    setText('sentinel-ep-label', `${s.episode_code} (${s.game_node_code}) — ${s.vulnerability_cve} (CVSS ${s.cvss_score})`);

    const traceEl = document.getElementById('sentinel-debug-trace');
    if (traceEl) {
      let traceText = (s.debug_steps || []).join('\n');
      if (s.native_cli_verification && s.native_cli_verification.lines) {
        traceText += '\n\n--- SALIDA DIRECTA DEL BINARIO NATIVO (--verify-killchain) ---\n' +
                     s.native_cli_verification.lines.join('\n');
      }
      traceEl.textContent = traceText;
    }

    renderEpisodeOrderedPatches(s.deployed_patches || []);

    cachedCumulativePatches = data.cumulative_patches || [];
    setText('sentinel-total-patches-badge', String(cachedCumulativePatches.length));
    renderCumulativePatchLedger();
  } catch (err) {
    console.error('Error in Aegis9SentinelService reaction:', err);
  }
}

function renderEpisodeOrderedPatches(patches) {
  const grid = document.getElementById('sentinel-episode-patches-grid');
  if (!grid) return;

  grid.innerHTML = patches.map((pt) => `
    <div class="patch-step-card" style="border-top-color: ${pt.badge_color};">
      <div class="patch-order-header">
        <span style="color: var(--magic-highlight);">ORDEN #${pt.episode_deployment_order} (GLOBAL #${pt.global_deployment_order})</span>
        <span class="patch-class-badge" style="color: ${pt.badge_color};">${pt.classification}</span>
      </div>
      <div style="font-weight: 700; color: var(--hud-glass-outline);">${pt.patch_id}</div>
      <div style="color: var(--bauble-cyan-bright); font-size: 0.72rem;">${pt.aegis9_module}</div>
      <p style="color: var(--magic-main); font-size: 0.74rem; flex: 1;">${pt.patch_description}</p>
      <code style="background: var(--bg-core); padding: 0.25rem 0.35rem; font-size: 0.69rem; color: var(--magic-highlight); display: block; overflow-x: auto;">${pt.cli_artifact}</code>
      <div style="display: flex; justify-content: space-between; font-size: 0.68rem; color: var(--hud-glass-outline);">
        <span>Ghost Sync: <strong style="color: #00F200;">${pt.ghost_sync_delta}</strong></span>
        <span>Bloque #${pt.ledger_block_index}</span>
      </div>
    </div>
  `).join('');
}

function renderCumulativePatchLedger() {
  const tbody = document.getElementById('sentinel-patch-ledger-tbody');
  if (!tbody) return;

  const filtered = cachedCumulativePatches.filter((pt) => {
    if (activePatchCategoryFilter === 'all') return true;
    return pt.category_code === activePatchCategoryFilter;
  });

  // Mostrar en orden de despliegue (del más reciente arriba o secuencial con su número de orden)
  tbody.innerHTML = filtered.slice().reverse().map((pt) => `
    <tr>
      <td><strong style="color: var(--magic-highlight);">#${pt.global_deployment_order}</strong> (Paso ${pt.episode_deployment_order}/4)</td>
      <td><span class="ep-code-badge">${pt.episode_code}</span> <span style="color: var(--bauble-cyan-bright);">${pt.game_node_code}</span></td>
      <td><span class="cvss-pill">${pt.target_cve}</span></td>
      <td><code>${pt.patch_id}</code></td>
      <td><span class="patch-class-badge" style="color: ${pt.badge_color};">${pt.classification}</span></td>
      <td><strong>${pt.aegis9_module}:</strong> ${pt.title}</td>
      <td><code title="${pt.sha256_block_hash}">${pt.sha256_block_hash.slice(0, 12)}...</code></td>
    </tr>
  `).join('');
}

function initAegis9SentinelControls() {
  const filterBtns = Array.from(document.querySelectorAll('.patch-filter-btn'));
  filterBtns.forEach((btn) => {
    btn.addEventListener('click', () => {
      filterBtns.forEach((b) => b.classList.remove('active'));
      btn.classList.add('active');
      activePatchCategoryFilter = btn.getAttribute('data-cat') || 'all';
      renderCumulativePatchLedger();
    });
  });

  const verifyBinBtn = document.getElementById('btn-sentinel-verify-bin');
  if (verifyBinBtn) {
    verifyBinBtn.addEventListener('click', () => {
      const activeCard = document.querySelector('.episode-card-item.active');
      const epId = activeCard ? activeCard.getAttribute('data-ep-id') : 1;
      triggerSentinelDebug(epId, true);
    });
  }
}

/* 5. Ejecutor Interactivo del Playbook de Mitigación */
function initPlaybookExecutor() {
  const btn = document.getElementById('btn-run-playbook');
  if (!btn) return;

  btn.addEventListener('click', () => {
    const cli = document.getElementById('pillar-mit-cli');
    const code = document.getElementById('pillar-mit-code');
    const status = document.getElementById('playbook-exec-status');
    const bar = document.getElementById('mitigation-progress-bar');
    const term = document.getElementById('blades-live-terminal');

    if (bar) {
      bar.style.width = '15%';
      setTimeout(() => { bar.style.width = '100%'; }, 120);
    }
    if (status) {
      status.textContent = 'ESTADO: MITIGACIÓN APLICADA (#00F200)';
    }
    if (term && cli) {
      const cmdText = cli.textContent.trim();
      const actionCode = code ? code.textContent.trim() : 'MIT-EXEC';
      term.textContent = `root@cyberia-medsoc:~# ${cmdText}\n` +
                         `[SOAR-EXEC] Playbook ${actionCode} completado con éxito. Integridad de soporte vital verificada al 100%.`;
    }
  });
}

/* 6. Mapa de Topología SVG Interactivo */
function initTopologyMap() {
  const sectors = Array.from(document.querySelectorAll('.topo-sector-node'));
  const actSelect = document.getElementById('soc-act-select');
  if (!sectors.length) return;

  sectors.forEach((sec) => {
    sec.addEventListener('click', () => {
      const actNum = sec.getAttribute('data-act');
      highlightTopologySector(actNum);
      if (actSelect) {
        actSelect.value = actNum;
        actSelect.dispatchEvent(new Event('change'));
      }
      const firstVisible = document.querySelector(`.episode-card-item[data-act="${actNum}"]`);
      if (firstVisible) {
        firstVisible.click();
      }
    });
  });
}

function highlightTopologySector(actNum) {
  const sectors = Array.from(document.querySelectorAll('.topo-sector-node'));
  sectors.forEach((sec) => {
    const rect = sec.querySelector('rect');
    if (!rect) return;
    if (String(sec.getAttribute('data-act')) === String(actNum)) {
      rect.setAttribute('stroke', '#30FF00');
      rect.setAttribute('stroke-width', '2.5');
      rect.setAttribute('fill', '#0F5150');
    } else {
      rect.setAttribute('stroke', '#2B87AB');
      rect.setAttribute('stroke-width', '1.5');
      rect.setAttribute('fill', '#00383B');
    }
  });
}

function setText(id, val) {
  const el = document.getElementById(id);
  if (el) el.textContent = val || '';
}
