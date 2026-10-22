/* ==========================================================================
   CYBERIA-MED // SOC Console v19.96 — Interactive Simulators Controller
   Drives:
   1. EP22 LOCKED OUT (BLADES MRI Logic Gate Solver) & EP26 GENIUS
   2. EP35 GRAFFITI (BLADES MRI 4-Valve + Main Rotor ECMO/Hydraulic Aligner)
   3. EP33 DRUG STORE & EP34 UNSAFE DOOR (Microscopic Pathogen Shooter & Inoculator)
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
  initLockedOutGateSimulator();
  initGraffitiHydraulicSimulator();
  initNanomedInoculatorSimulator();
});

/* 1. Simulador EP22 LOCKED OUT & EP26 GENIUS */
function initLockedOutGateSimulator() {
  const gateButtons = ['btn-gate-a', 'btn-gate-b', 'btn-gate-c'].map((id) => document.getElementById(id));
  const runBtn = document.getElementById('btn-run-mri-gates');
  const geniusBtn = document.getElementById('btn-run-genius-defuse');
  const output = document.getElementById('mri-gate-output');

  if (!runBtn) return;

  gateButtons.forEach((btn, idx) => {
    if (!btn) return;
    const label = ['A', 'B', 'C'][idx];
    btn.addEventListener('click', () => {
      const current = btn.getAttribute('data-state') === 'true';
      const next = !current;
      btn.setAttribute('data-state', String(next));
      btn.classList.toggle('active-high', next);
      btn.textContent = `INPUT ${label}: [${next ? '1 / TRUE' : '0 / FALSE'}]`;
    });
  });

  runBtn.addEventListener('click', async () => {
    const a = document.getElementById('btn-gate-a')?.getAttribute('data-state') === 'true';
    const b = document.getElementById('btn-gate-b')?.getAttribute('data-state') === 'true';
    const c = document.getElementById('btn-gate-c')?.getAttribute('data-state') === 'true';

    const res = await fetch('/api/blades/mri-scan', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ mode: 'locked_out_gates', input_a: a, input_b: b, input_c: c })
    });
    const data = await res.json();
    if (output) {
      output.style.color = data.status_color || '#83FF65';
      output.textContent = `[${data.episode}] ${data.message}\n` +
                           `Inputs: A=${data.inputs.input_a}, B=${data.inputs.input_b}, C=${data.inputs.input_c} => SOLENOID=${data.solenoid_unlocked}`;
    }
  });

  if (geniusBtn) {
    geniusBtn.addEventListener('click', async () => {
      const res = await fetch('/api/blades/mri-scan', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          mode: 'genius_symbols',
          sequence: ['BLUE_ARROW_DOWN', 'RED_BROKEN_CIRCLE', 'RED_SQUARE', 'BLUE_TRIANGLE']
        })
      });
      const data = await res.json();
      if (output) {
        output.style.color = data.status_color || '#00F200';
        output.textContent = `[${data.episode}] ${data.message}\n` +
                             `Secuencia validada: ${data.sequence_submitted.join(' -> ')}`;
      }
    });
  }
}

/* 2. Simulador EP35 GRAFFITI (4 Válvulas Periféricas + Bomba Maestra) */
function initGraffitiHydraulicSimulator() {
  const valveBtns = Array.from(document.querySelectorAll('.valve-toggle'));
  const pumpBtn = document.getElementById('btn-engage-main-pump');
  const output = document.getElementById('graffiti-valve-output');
  if (!pumpBtn) return;

  const valveNames = ['V1 (VENOSA)', 'V2 (OXIGENADOR)', 'V3 (INTERCAMBIADOR)', 'V4 (FILTRO ARTERIAL)'];

  valveBtns.forEach((btn, idx) => {
    btn.addEventListener('click', () => {
      const isOpen = btn.getAttribute('data-open') === 'true';
      const next = !isOpen;
      btn.setAttribute('data-open', String(next));
      btn.classList.toggle('active-high', next);
      btn.textContent = `${valveNames[idx]}: ${next ? 'OPEN' : 'CLOSED'}`;
    });
  });

  pumpBtn.addEventListener('click', async () => {
    const valves = valveBtns.map((b) => b.getAttribute('data-open') === 'true');
    const res = await fetch('/api/blades/mri-scan', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        mode: 'graffiti_hydraulics',
        valves: valves,
        main_pump: true
      })
    });
    const data = await res.json();
    if (output) {
      output.style.color = data.status_color || '#83FF65';
      output.textContent = `[${data.episode}]\n${data.message}\nEstado Válvulas: ${JSON.stringify(data.valves_state)}`;
    }
  });
}

/* 3. Simulador EP33 DRUG STORE & EP34 UNSAFE DOOR (Visor Microscópico & Inoculador) */
function initNanomedInoculatorSimulator() {
  const canvas = document.getElementById('nanomed-microscope-canvas');
  const runBtn = document.getElementById('btn-run-inoculator');
  const select = document.getElementById('nanomed-compound-select');
  const output = document.getElementById('nanomed-inoculator-output');
  const badge = document.getElementById('nanomed-vital-badge');

  if (!canvas || !runBtn) return;
  const ctx = canvas.getContext('2d');

  const pathogens = Array.from({ length: 7 }, (_, i) => ({
    x: 35 + (i * 40),
    y: 30 + ((i * 23) % 80),
    r: 9,
    vx: (i % 2 === 0 ? 1 : -1) * 1.1,
    vy: (i % 3 === 0 ? 1 : -1) * 0.9,
    alive: true
  }));

  function renderMicroscope() {
    ctx.fillStyle = '#093534';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    // Retícula circular de microscopio BLADES
    ctx.strokeStyle = 'rgba(178, 229, 242, 0.25)';
    ctx.beginPath();
    ctx.arc(canvas.width / 2, canvas.height / 2, 58, 0, Math.PI * 2);
    ctx.stroke();

    pathogens.forEach((p) => {
      if (!p.alive) return;
      p.x += p.vx;
      p.y += p.vy;
      if (p.x < 12 || p.x > canvas.width - 12) p.vx *= -1;
      if (p.y < 12 || p.y > canvas.height - 12) p.vy *= -1;

      ctx.beginPath();
      ctx.fillStyle = '#00F200';
      ctx.strokeStyle = '#E7F800';
      ctx.lineWidth = 1.5;
      ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
      ctx.fill();
      ctx.stroke();
    });

    requestAnimationFrame(renderMicroscope);
  }

  requestAnimationFrame(renderMicroscope);

  canvas.addEventListener('click', (e) => {
    const rect = canvas.getBoundingClientRect();
    const scaleX = canvas.width / rect.width;
    const scaleY = canvas.height / rect.height;
    const clickX = (e.clientX - rect.left) * scaleX;
    const clickY = (e.clientY - rect.top) * scaleY;

    pathogens.forEach((p) => {
      const dist = Math.hypot(p.x - clickX, p.y - clickY);
      if (dist <= p.r + 12) {
        p.alive = false;
      }
    });
  });

  runBtn.addEventListener('click', async () => {
    pathogens.forEach((p) => { p.alive = false; });
    const compound = select ? select.value : 'ANTIDOTE-01';
    const strainMap = {
      'ANTIDOTE-01': 'CYBERIA-RANSOM-ALPHA',
      'ANTIDOTE-02': 'HALON-WORM-BETA',
      'ANTIDOTE-03': 'DEVLIN-ROOTKIT-OMEGA'
    };

    const res = await fetch('/api/medsec/inoculate', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        compound: compound,
        strain: strainMap[compound] || 'CYBERIA-RANSOM-ALPHA',
        force_purge: true
      })
    });
    const data = await res.json();
    if (output) {
      output.style.color = '#00F200';
      output.textContent = `[${data.episodes.join(' -> ')}]\n` +
                           `${data.message}\n` +
                           `TOKEN DE PURGA UNSAFE DOOR: ${data.purge_token} // INTEGRIDAD: ${data.patient_vital_integrity}%`;
    }
    if (badge) {
      badge.textContent = 'INOCULADO: 100%';
    }
    setTimeout(() => {
      pathogens.forEach((p) => { p.alive = true; });
    }, 2500);
  });
}
