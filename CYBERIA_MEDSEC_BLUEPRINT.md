# CYBERIA-MED // SOC Console v19.96 — MASTER ARCHITECTURAL BLUEPRINT

> **Sistema:** CYBERIA-MED // SOC Console v19.96 (Clinical Security Operations Center & IoMT Telemetry Terminal)  
> **Stack Tecnológico:** Ruby 3.x + Sinatra (Modular Architecture) + Puma + SQLite3/JSON + RSpec + Vanilla JS/Canvas HUD  
> **Inspiración Narrativa & Lore:** *Cyberia* (Xatrix Entertainment / Interplay, PlayStation 1996 — 48 Episodios / Spoilers Integrales de Principio a Fin)  
> **Sistema de Diseño Visual:** Ultimate Queen Chrysalis Palette (MLP Vector Club #523) adaptada a Terminal Biomédica Retro-Futurista MRI/ECG  
> **Dominio Técnico:** Ciberseguridad Hospitalaria, IoMT (Internet of Medical Things), HL7 v2/v3, FHIR, DICOM/PACS, IEEE 11073, IEC 62443, SCADA de Gases Clínicos y Biocontención BSL-4.

---

## ÍNDICE DEL BLUEPRINT MAESTRO

1. **Arquitectura General y Filosofía de Diseño**
2. **Especificación Completa de la Paleta Hexadecimal (Ultimate Queen Chrysalis #523)**
3. **Matriz Maestra de los 48 Episodios (Lore Cyberia 1996 + Mapeo Clínico SOC + 4 Pilares)**
4. **Secuencia de 10 Prompts de Ingeniería para Antigravity IDE (AGY):**
   - **PROMPT 01:** Scaffolding Modular en Ruby/Sinatra, Gemfile y Arquitectura Base.
   - **PROMPT 02:** Sistema de Diseño CSS `chrysalis_medsoc.css` (Tokens, CRT/MRI Scanlines, ECG Animations).
   - **PROMPT 03:** Motor de Datos y Semilla Parte 1 (Episodios 01 al 16 — *Acto I: The Rig & Acto II: Ruta Ártica*).
   - **PROMPT 04:** Semilla Parte 2 (Episodios 17 al 32 — *Túnel Subterráneo, Complejo Cyberia Nivel 1 y Nivel 2 Inicial*).
   - **PROMPT 05:** Semilla Parte 3 (Episodios 33 al 48 — *Nanomedicina, Núcleo Biocibernético, Traición de Devlin y Asalto Orbital*).
   - **PROMPT 06:** Backend Sinatra, Servicios de Dominio Clínico y API RESTful (`/api/episodes`, `/api/blades/mri-scan`, `/api/medsec/inoculate`).
   - **PROMPT 07:** Frontend Consola Principal ERB + HUD Interactivo (Monitor ECG `#00F200`, Topología Hospitalaria y Buscador SIEM).
   - **PROMPT 08:** Simuladores Interactivos MedSec (*BLADES MRI Logic Gate Solver* & *Nanomedicine EDR Inoculator*).
   - **PROMPT 09:** Generador de Informes Forenses Post-Mortem y Boletines de Cumplimiento (HIPAA / IEC 62443) en Markdown/JSON.
   - **PROMPT 10:** Suite de Pruebas Automatizadas RSpec y Script de Despliegue/Verificación Integral.

---

## 1. ARQUITECTURA GENERAL Y TRADUCCIÓN DE DOMINIO

En **CYBERIA-MED // SOC Console v19.96**, toda la trama de *Cyberia (1996)* protagonizada por el ciber-hacker **Zak** en el año 2027 se modela como una operación crítica de respuesta a incidentes y auditoría forense sobre una infraestructura hospitalaria distribuida de alta complejidad:

* **Implante Biocybernético BLADES (`Biocybernetic Sensor: InfRared, Magnetic Resonance, Biometric Scan`):** Actúa como el motor central del SOC que combina **Inspección Profunda de Paquetes (DPI)** para protocolos clínicos (`HL7`, `DICOM`, `FHIR`, `IEEE 11073`), **Escaneo de Resonancia Magnética Lógica (MRI Firmware Debugger)** para auditar PLCs y bombas médicas, y **Análisis Térmico/Infrarrojo** para detectar anomalías físicas en laboratorios criogénicos y salas de servidores.
* **Acto I (`THE RIG` - Plataforma en el Mar del Norte):** Representa el **Hospital de Campaña Marítimo y Nodo de Triaje Perimetral Offshore**, donde convergen enlaces de telemedicina, sistemas de defensa DDoS (`SKEET SHOOT`), amenazas internas por conflictos de personal (`MEET GIA`, `BIG KISS`, `ZAPPED`), tableros de aislamiento eléctrico de quirófano (`EASY RIDE`, `BIG SHOCK`), cadena de frío farmacéutica (`OPEN OCEAN`), microsegmentación de emergencia (`CATWALK`) y transporte aéreo autónomo MedEvac (`STEAL PLANE`).
* **Acto II (`ARCTIC EVACUATION & SUPPLY TUNNELS`):** Representa la **Red de Telemetría en Tránsito, Enlaces Satelitales y Backbone Subterráneo**, protegiendo las comunicaciones de ambulancias aéreas contra interferencias RF (`ISLAND RUN`), filtrado en pasarelas de borde (`VALLEY RUN`), ruido electromagnético (`ROUGH RIDE`), neutralización de C2 Sinkholes en puertos de suministro (`PORT FLYBY`), prevención de saturación de bus CAN/Backbone (`UNDERGROUND`), conmutación a sistemas UPS/diésel (`PIT STOP`) y protección de sistemas HVAC criogénicos (`ICE SCREAM`).
* **Acto III (`CYBERIA COMPLEX - LEVEL 1`):** Representa el **Campus Hospitalario Principal, Admisiones, Quirófanos Láser y Servidores HIS**, cubriendo auditoría de accesos físicos/lógicos (`COLD FEET`), mitigación de fuerza bruta VPN (`DOOR MAN`), diagnóstico MRI de puertas lógicas de esclusas quirúrgicas (`LOCKED OUT`), interlocks de seguridad en bisturíes láser robóticos (`SLICEOMATIC`), contención de malware en Wi-Fi clínico (`NOT FRIENDS`), sniffer pasivo de tráfico sin cifrar (`LISTEN IN`), desactivación de bombas lógicas en el servidor de Historias Clínicas (`GENIUS`) y control de montacargas de evacuación (`Crate Override`).
* **Acto IV (`CYBERIA COMPLEX - LEVEL 2`):** Representa los **Laboratorios de Biocontención, SCADA de Gases Medicinales y Estaciones de Nanomedicina**, abordando el sistema de extinción por gas Halón (`RED LIGHT`), secuestro de sesiones en consolas UCI (`Glass Room Breach`), auditoría forense de terminales V-Mail y estado de pacientes (`Patient Status Terminal`), bypass de redes Air-Gap por ductos físicos (`Ventilation Shaft Keycard`), honeypots clínicos en la sala plateada (`Silver Room Perimeter`), neutralización microscópica de ransomware en bombas de infusión (`DRUG STORE`), protocolos de cuarentena e inoculación en zonas biológicas contaminadas (`UNSAFE DOOR`) y calibración MRI de válvulas hidráulicas/ECMO (`GRAFFITI`).
* **Acto V (`BIOCYBERNETIC CORE & THE CYBERIA PROJECT`):** Representa el **Búnker Criogénico Profundo, el Laboratorio BSL-4 y la Simbiosis SOAR/BCI**, cubriendo ultracongeladores de órganos/vacunas (`Cryo-Stasis Chamber`), detección de código mutante autónomo documentado por el Dr. Zimmer (`Scientist Dossier`), revocación masiva de certificados PKI (`Core Security Purge`), validación TPM en esclusas BSL-4 (`BSL-4 Airlock`), descubrimiento de la traición ejecutiva de William Devlin como cuenta Root/CISO maliciosa (`FWA Telemetry Leak`), sandboxing del artefacto viviente Zero-Day (`The Living Weapon`), sincronización de interfaz cerebro-computadora (`YOU WITH ME - Part 1`), orquestación autónoma SOAR (`YOU WITH ME - Part 2`) y purga de canales C2 (`Silo Breakout`).
* **Acto VI (`ORBITAL VENGEANCE AGAINST DEVLIN`):** Representa la **Erradicación Global de la Amenaza Persistente Avanzada (APT) y Resiliencia Satelital**, asegurando constelaciones GPS/MedEvac (`Orbital Insertion`), desmantelando botnets IoMT orbitales (`Orbital Defense Grid`), anulando el *Kill-Switch* remoto contra marcapasos e implantes neuronales (`Command Core Breach`) y ejecutando la erradicación total de William Devlin con el reporte Post-Mortem final (`Total Threat Eradication`).

---

## 2. ESPECIFICACIÓN COMPLETA DE LA PALETA HEXADECIMAL (ULTIMATE QUEEN CHRYSALIS #523)

Todos los componentes visuales del sistema deben utilizar **estrictamente** los siguientes tokens CSS extraídos de la paleta **Ultimate Queen Chrysalis (MLP Vector Club #523)**:

| Categoría Anatómica (#523) | Rol en Consola Clínica CYBERIA-MED | Variable CSS | Código HEX / RGBA Exacto |
| :--- | :--- | :--- | :--- |
| **Coat (Shadow Outline)** | Fondo principal del núcleo de consola SOC | `--bg-core` | `#0E1111` |
| **Coat (Outline)** | Fondo de paneles laterales y contenedores secundarios | `--bg-panel` | `#121312` |
| **Coat (Shadow Fill)** | Superficie interna de tarjetas de telemetría (Sombra) | `--bg-surface-shadow` | `#252525` |
| **Coat (Fill)** | Superficie principal de tarjetas de dispositivos IoMT | `--bg-surface` | `#292929` |
| **Coat (Blemishes)** | Bordes inactivos, rejillas divisorias y separadores | `--bg-elevated` | `#3D3E3D` |
| **Armor (Outline)** | Borde estructural de ventanas clínicas y marcos | `--border-structural` | `#164E62` |
| **Mane & Tail (Fill)** | Cabeceras de paneles, barras de título y navegación | `--panel-header` | `#1A566D` |
| **Mane & Tail (Outline)** | Borde activo de cabeceras y pestañas seleccionadas | `--panel-header-border` | `#2B87AB` |
| **Carapace (Grad Start)** | Inicio de gradiente de caparazón (Barras de estado) | `--carapace-grad-start` | `#218984` |
| **Carapace (Grad End)** | Fin de gradiente de caparazón (Salud de subred) | `--carapace-grad-end` | `#6CC929` |
| **Carapace (Deep 1)** | Fondo profundo de tablas de datos DICOM/HL7 | `--carapace-deep-1` | `#00485C` |
| **Carapace (Deep 2)** | Fondo intermedio de gráficas de telemetría | `--carapace-deep-2` | `#14747E` |
| **Carapace (Deep 3)** | Acento de tablas y filas activas | `--carapace-deep-3` | `#409979` |
| **Bauble (Fill)** | Indicador de nodo IoMT conectado (Estable) | `--bauble-cyan-fill` | `#218595` |
| **Bauble (Highlight)** | Destello de tráfico activo en nodo médico | `--bauble-cyan-bright` | `#29C2DA` |
| **Magic (Inner Shine)** | Pulso crítico ECG / Infección activa / Alerta máxima | `--magic-pulse-core` | `#00F200` |
| **Magic (Concentric Outline)** | Anillos de radar BLADES y ondas de choque `@keyframes` | `--magic-ring` | `#30FF00` |
| **Magic (Main Outline)** | Texto principal de terminal, métricas y consola | `--magic-main` | `#83FF65` |
| **Magic (Highlighted Outline)** | Estado Hover, foco activo y cursores de consola | `--magic-highlight` | `#A4FF8E` |
| **Horn (Gradient Start)** | Inicio de barra de progreso de mitigación/inoculación | `--horn-grad-start` | `#5B9E00` |
| **Horn (Gradient End)** | Fin de barra de progreso de mitigación completada | `--horn-grad-end` | `#9DE209` |
| **Iris (High Warning 1)** | Alerta heurística SIEM de severidad alta | `--iris-warning-high` | `#E7F800` |
| **Iris (High Warning 2)** | Anomalía secundaria en protocolo clínico | `--iris-warning-mid` | `#AEF504` |
| **Iris (Deep Background 1)** | Fondo primario de visor óptico BLADES / MRI | `--iris-bg-deep-1` | `#00383B` |
| **Iris (Deep Background 2)** | Fondo secundario de matriz de resonancia magnética | `--iris-bg-deep-2` | `#093534` |
| **Iris (Deep Background 3)** | Resplandor interior de retícula de escaneo | `--iris-bg-deep-3` | `#0F5150` |
| **Wings (Glass Outline)** | Borde cristalino de modales y capas HUD translúcidas | `--hud-glass-outline` | `#B2E5F2` |
| **Wings (Glass Fill Light)** | Relleno translúcido primario para visores superpuestos | `--hud-glass-fill-light` | `rgba(36, 155, 167, 0.6)` (`#249BA7`) |
| **Wings (Glass Fill Dark)** | Relleno translúcido secundario para paneles flotantes | `--hud-glass-fill-dark` | `rgba(12, 82, 106, 0.3)` (`#0C526A`) |

---
## 3. MATRIZ MAESTRA DE LOS 48 EPISODIOS (SPOILERS COMPLETOS DE CYBERIA 1996 + SOC HOSPITALARIO)

A continuación se documentan los **48 episodios íntegros** sin omitir ningún evento narrativo ni técnico. Cada episodio vincula el lugar exacto y el spoiler de *Cyberia (1996)* con su equivalente en el **Medical SOC** y sus **4 pilares obligatorios** (Vulnerabilidad, Detección, Mitigación y Prevención):

### ACTO I: PLATAFORMA OFFSHORE "THE RIG" (HOSPITAL DE CAMPAÑA MARÍTIMO Y NODO DE TRIAJE)

#### EP01 — Indulto Neuronal (`FWA Quarantine Dock`)
* **Ubicación en Cyberia (1996):** Muelle de Cuarentena Criogénica de la First World Alliance (FWA), año 2027.
* **Spoiler Completo de la Trama:** El ciber-hacker Zak es despertado del sueño criogénico tras haber sido condenado por crímenes informáticos. William Devlin, líder del consejo de la FWA, le otorga un indulto forzoso: la inteligencia aliada descubrió que el Cartel rival construye un arma secreta llamada "Cyberia" en una base en Siberia. Devlin implanta y calibra en el cráneo de Zak el sistema óptico experimental **BLADES** (*Biocybernetic Sensor: InfRared, Magnetic Resonance, Biometric Scan*) antes de enviarlo a la plataforma marítima de contacto.
* **Contraparte en el SOC Hospitalario:** Unidad de Descongelación Criogénica y Nodo Maestro de Historias Clínicas Electrónicas (EHR / FHIR Server).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0101` (CVSS 9.1) — Deserialización insegura en paquetes `HL7 FHIR R4 Patient` durante la reanimación criogénica y carga de firmware sin firma criptográfica en el implante óptico BLADES.
  2. *Detección:* Regla Sigma que alerta sobre tramas `IEEE 11073-20601` con cabeceras de telemetría neuronal modificadas fuera de la ventana de calibración quirúrgica.
  3. *Mitigación:* Aislamiento inmediato del segmento VLAN de reanimación, validación de hash SHA-3 del kernel de BLADES y rotación de claves efímeras TLS 1.3 en el servidor EHR.
  4. *Prevención de Incidentes:* Implementación de atestación remota mediante chip TPM biomédico y firmado obligatorio de imágenes de firmware para prótesis neuronales.

#### EP02 — Atraque en la Plataforma (`RIG DOCK`)
* **Ubicación en Cyberia (1996):** Muelle de atraque exterior de la plataforma petrolífera offshore *The Rig* en el Mar del Norte.
* **Spoiler Completo de la Trama:** Zak llega en una lancha furtiva en medio de la niebla nocturna a la plataforma controlada por el mercenario Santos, quien supuestamente facilitará el avión furtivo TF-22 para infiltrarse en Rusia. Al desembarcar, Zak escanea las pasarelas oxidadas y detecta una atmósfera hostil: los hombres de Santos vigilan cada rincón con armamento pesado.
* **Contraparte en el SOC Hospitalario:** Pasarela Perimetral de Telemedicina Marítima y DMZ del Hospital de Campaña Offshore.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0102` (CVSS 8.4) — Exposición de puertos DICOM (`TCP 104` / `2762`) sin autenticación mutua en el concentrador de telemedicina satelital del muelle.
  2. *Detección:* Sondeo anómalo de asociaciones DICOM (`A-ASSOCIATE-RQ`) con `Calling AE Title` falsificado proveniente de subredes marítimas externas.
  3. *Mitigación:* Bloqueo en cortafuegos perimetral de asociaciones DICOM no incluidas en la lista blanca criptográfica y encapsulamiento inmediato sobre túnel IPSec/WireGuard.
  4. *Prevención de Incidentes:* Arquitectura Zero Trust Network Access (ZTNA) para buques ambulancia y plataformas offshore según IEC 62443-3-3.

#### EP03 — Desarme frente a Gia (`MEET GIA`)
* **Ubicación en Cyberia (1996):** Corredor blindado de acceso a la batería de artillería en *The Rig*.
* **Spoiler Completo de la Trama:** Al avanzar por el pasillo metálico, Zak es interceptado por Gia, la letal lugarteniente de Santos, quien le apunta directamente a la cabeza con su pistola. Gia le ordena que guarde su arma y gire lentamente. Si el jugador tarda demasiado, intenta disparar o gira hacia el lado incorrecto sin enfundar, Gia le dispara a quemarropa matándolo en el acto. Al obedecer con precisión milimétrica, Gia baja el arma y lo conduce hacia la torreta.
* **Contraparte en el SOC Hospitalario:** Esclusa de Control de Acceso Físico-Lógico y Motor UEBA (User and Entity Behavior Analytics) de la Sala de Control UCI.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0103` (CVSS 7.8) — Condición de carrera (*Race Condition*) en el protocolo de apretón de manos de lectores biométricos de esclusas quirúrgicas que permite escalada de privilegios o bloqueo letal.
  2. *Detección:* Motor UEBA que mide la latencia de respuesta de credenciales del operador y detecta comandos fuera de secuencia en el bus `OSDP v2` de control de puertas.
  3. *Mitigación:* Revocación instantánea de tokens de sesión con comportamiento errático y activación de modo de verificación de doble custodio en esclusas críticas.
  4. *Prevención de Incidentes:* Políticas de mínimo privilegio contextual y autenticación continua basada en telemetría de comportamiento del operador clínico.

#### EP04 — Defensa en la Silla de Artillería (`SKEET SHOOT`)
* **Ubicación en Cyberia (1996):** Torreta de cañón de plasma antiaéreo en la cubierta superior de *The Rig*.
* **Spoiler Completo de la Trama:** Antes de poder negociar con Santos, un escuadrón de bombarderos y cazas del Cartel lanza un ataque aéreo masivo contra la plataforma. Zak se sienta en la silla de artillería rotatoria y debe derribar oleadas de aviones enemigos utilizando el radar circular mientras vigila los **6 indicadores azules de integridad estructural** de la plataforma; si los 6 nodos azules son destruidos por las bombas, la plataforma entera explota.
* **Contraparte en el SOC Hospitalario:** Centro de Mitigación Activa de DDoS Volumétrico sobre los 6 Nodos Críticos de Soporte Vital (Oxígeno, Vacío, Energía UCI, PACS, HIS, Farmacia Robotizada).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0104` (CVSS 9.6) — Agotamiento de tabla de estados en los balanceadores de carga clínicos por inundación UDP/SYN dirigida a los 6 clústeres de telemetría de soporte vital.
  2. *Detección:* Telemetría NetFlow/sFlow en tiempo real que dispara alerta crítica cuando la capacidad de cualquiera de los 6 nodos azules de integridad cae por debajo del 80%.
  3. *Mitigación:* Activación de *Scrubbing Center* local con filtrado eBPF/XDP en el kernel para descartar paquetes maliciosos a velocidad de línea sin interrumpir el tráfico HL7 de camas UCI.
  4. *Prevención de Incidentes:* Redundancia activa-activa multi-zona con QoS prioritario garantizado para tráfico de soporte vital (`DSCP EF`).

#### EP05 — El Dilema de Gia y los Celos de Santos (`BIG KISS`)
* **Ubicación en Cyberia (1996):** Pasarela exterior junto a la torreta tras repeler el ataque aéreo en *The Rig*.
* **Spoiler Completo de la Trama:** Impresionada por la puntería de Zak al salvar la plataforma, Gia se acerca seductoramente y le ofrece un beso. El jugador tiene una decisión ramificada crítica: si Zak acepta y la besa, Santos aparece furioso por los celos y su matón golpea a Zak por la espalda dejándolo inconsciente de inmediato; si Zak se aparta y rechaza el beso, evita el golpe en ese instante y camina por su propio pie hacia el ascensor (aunque la traición de Santos ya está sellada).
* **Contraparte en el SOC Hospitalario:** Módulo de Detección de Ingeniería Social, *Insider Threat* y Compromiso de Credenciales Privilegiadas por Conflicto Interno.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0105` (CVSS 8.2) — Abuso de confianza implícita entre operadores con privilegios elevados (*Split-Horizon Trust Violation*) que expone llaves maestras de administración clínica.
  2. *Detección:* Correlación SIEM de inicios de sesión simultáneos anómalos e intento de suplantación de sesión PAM (*Privileged Access Management*) tras interacción no autorizada entre operadores.
  3. *Mitigación:* Congelación preventiva de cuentas de contratistas externos (grupo `SANTOS_MERC_OPS`) y exigencia de re-autenticación FIDO2 resistente a phishing.
  4. *Prevención de Incidentes:* Segregación de funciones (SoD) estricta y monitoreo continuo de amenazas internas en personal con acceso a infraestructura crítica hospitalaria.

#### EP06 — Escáner Visor del Ascensor (`GOING UP`)
* **Ubicación en Cyberia (1996):** Elevador industrial de carga que conecta la cubierta inferior con el puente grúa del hangar en *The Rig*.
* **Spoiler Completo de la Trama:** Si Zak no fue noqueado en el episodio anterior, aborda el ascensor con Gia y utiliza por primera vez el visor de su implante cibernético BLADES para escanear e interactuar con el panel electrónico del elevador, activando el ascenso hacia el nivel superior donde aguarda Santos.
* **Contraparte en el SOC Hospitalario:** Sistema de Control de Ascensores Quirúrgicos de Traslado Crítico (UCI/Quirófano) con Autenticación Biométrica Multifactor.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0106` (CVSS 7.5) — Comandos Modbus/TCP sin cifrar en el controlador del elevador de pacientes críticos que permiten secuestro de piso o bloqueo de cabina.
  2. *Detección:* Inspección profunda de paquetes (DPI) del motor BLADES detectando códigos de función Modbus `0x05` (Write Single Coil) emitidos sin firma biométrica válida.
  3. *Mitigación:* Conmutación del PLC del ascensor a modo seguro local validado únicamente mediante firma criptográfica del visor biométrico BLADES.
  4. *Prevención de Incidentes:* Microsegmentación física del bus de automatización de edificios (BMS/BACnet) separándolo completamente de la red clínica general.

#### EP07 — Traición en el Puente Grúa (`ZAPPED`)
* **Ubicación en Cyberia (1996):** Pasarela elevada sobre el hangar de *The Rig*.
* **Spoiler Completo de la Trama:** Al salir del ascensor, Santos acorrala a Zak revelando su traición: ya le vendió la información y la cabeza de Zak al Cartel porque pagan mejor que la FWA. El guardia de Santos dispara un arma de descarga eléctrica que electrocuta a Zak y lo derriba. Mientras Santos se burla, un diminuto dron espía volador de William Devlin observa y transmite toda la traición en secreto desde las vigas del techo.
* **Contraparte en el SOC Hospitalario:** Detección de Ataque a la Cadena de Suministro (*Supply Chain Betrayal*) y Telemetría de Descarga no Autorizada en Desfibriladores en Red.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0107` (CVSS 9.4) — Backdoor introducido por proveedor externo en la pasarela de telemetría que permite enviar pulsos de descarga remota a desfibriladores conectados y exfiltrar datos al Cartel.
  2. *Detección:* Sonda pasiva fuera de banda (*Out-of-Band Drone Tap*) que captura el tráfico de exfiltración TLS hacia IPs del Cartel y registra el pico de voltaje anómalo en el bus biomédico.
  3. *Mitigación:* Corte automático del enlace BGP/VPN con el proveedor comprometido y bloqueo por hardware del circuito de descarga remota en dispositivos de cardiología.
  4. *Prevención de Incidentes:* Auditoría criptográfica de terceros (SBOM - Software Bill of Materials) y telemetría de vigilancia independiente en nodos de borde.

#### EP08 — Despertar en la Morgue de Carga (`EASY RIDE`)
* **Ubicación en Cyberia (1996):** Bodega de almacenamiento inferior de *The Rig*, habilitada como cámara de ejecución.
* **Spoiler Completo de la Trama:** Zak recobra el conocimiento atado de pies y manos en el suelo junto a una bomba de tiempo activada que hace tic-tac. Santos se despide con arrogancia, pero al caminar hacia la salida en la penumbra comete un error fatal: pisa directamente sobre una rejilla de alta tensión electrificada en el suelo y muere horriblemente electrocutado y carbonizado frente a los ojos de Zak.
* **Contraparte en el SOC Hospitalario:** Monitoreo del Sistema de Aislamiento Eléctrico de Quirófano (Tablero IT / Vigilancia de Fuga a Tierra) y Morgue Clínica.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0108` (CVSS 8.9) — Manipulación del monitor de aislamiento de línea (LIM) en el tablero eléctrico de quirófano que oculta fallas a tierra letales y temporizadores de apagado maliciosos.
  2. *Detección:* Sensores de corriente diferencial residual que detectan el arco voltaico letal en la rejilla conductora (`> 300 mA`) y el proceso cron oculto (`timebomb.sh`) en la unidad de control.
  3. *Mitigación:* Desconexión selectiva del circuito en cortocircuito mediante disyuntores inteligentes e inhibición temporal del temporizador de sabotaje.
  4. *Prevención de Incidentes:* Sistemas de potencia aislada (IPS) con monitoreo analógico redundante independiente del SCADA principal.

#### EP09 — Cortocircuito y Cartucho de Energía (`BIG SHOCK`)
* **Ubicación en Cyberia (1996):** Suelo electrificado de la bodega de carga junto al cadáver humeante de Santos en *The Rig*.
* **Spoiler Completo de la Trama:** Antes de que la bomba explote, Zak rueda por el suelo, utiliza la chispa de la rejilla eléctrica para quemar y romper sus ataduras, salta sobre el cuerpo carbonizado de Santos para no electrocutarse, recupera su pistola láser y registra el cadáver de Santos para extraer el **Power Pack** (cartucho de energía indispensable para recargar su arma).
* **Contraparte en el SOC Hospitalario:** Recuperación Forense de Tokens Criptográficos de Hardware (HSM / SmartCard) desde Nodos Siniestrados y Recarga de Emergencia.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0109` (CVSS 7.9) — Persistencia de llaves privadas maestras en memoria volátil de dispositivos de administración tras un fallo eléctrico catastrófico (*Cold Boot / Power Surge Extraction*).
  2. *Detección:* Alerta en el bus de seguridad física al detectar la extracción física del módulo energético/criptográfico `PowerPack-HSM` del terminal del administrador caído.
  3. *Mitigación:* Reasignación autorizada del certificado de emergencia al agente de respuesta (Zak) y desactivación definitiva de la bomba lógica antes del conteo cero.
  4. *Prevención de Incidentes:* Módulos HSM con borrado automático por pérdida de pulso vital (*Dead-Man Switch*) y blindaje contra ataques de inyección de fallos por voltaje.

#### EP10 — Laberinto de Suministros y Francotirador (`OPEN OCEAN`)
* **Ubicación en Cyberia (1996):** Almacén de contenedores de carga y escaleras metálicas de *The Rig*.
* **Spoiler Completo de la Trama:** Zak escapa de la habitación de la bomba hacia el laberinto de cajas de suministros. Un guardia del Cartel/Santos está emboscado en las sombras junto a la escalerilla que sube al hangar; Zak debe usar el visor térmico/infrarrojo o disparar con precisión milimétrica al asomarse entre los contenedores para abatir al tirador antes de subir.
* **Contraparte en el SOC Hospitalario:** Almacén Robotizado de Cadena de Frío Farmacéutica y Detección Infrarroja de Nodos *Rogue* Ocultos.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0110` (CVSS 8.1) — Inserción de punto de acceso *Rogue Wi-Fi / RFID Skimmer* oculto entre los contenedores refrigerados de medicamentos oncológicos y hemoderivados.
  2. *Detección:* Barrido espectral e infrarrojo del módulo BLADES que localiza la firma térmica y de radiofrecuencia del nodo intruso apostado en el cuello de botella de la red de almacén.
  3. *Mitigación:* Neutralización dirigida mediante desautenticación selectiva y bloqueo de dirección MAC/puerto físico en el switch de distribución del almacén (`SW-PHARMA-02`).
  4. *Prevención de Incidentes:* Autenticación 802.1X EAP-TLS obligatoria en cada puerto de red del almacén farmacéutico y monitoreo continuo WIDS/WIPS.

#### EP11 — Emboscada en la Pasarela Superior (`CATWALK`)
* **Ubicación en Cyberia (1996):** Puerta blindada superior que conecta las escaleras del almacén con la pasarela del hangar del TF-22.
* **Spoiler Completo de la Trama:** Al subir la escalera y cruzar la compuerta hacia el hangar, Zak enfrenta una trampa mortal de dos frentes: si no se gira inmediatamente hacia el panel de la pared para bloquear electrónicamente la puerta que acaba de cruzar, un guardia lo acribilla por la espalda; acto seguido, debe girarse al frente y abatir al segundo guardia oculto tras las cajas de la pasarela.
* **Contraparte en el SOC Hospitalario:** Microsegmentación de Emergencia (*Instant Port Lockdown*) para Detener Movimiento Lateral de Ransomware en Dos Frentes.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0111` (CVSS 9.3) — Explotación simultánea de SMBv3 y RPC para movimiento lateral rápido desde la subred de logística hacia el hangar de evacuación aeromédica.
  2. *Detección:* Detección de tráfico de barrido lateral bidireccional (*Pincer Attack*) intentando cruzar el puente de red entre la VLAN 20 (Almacén) y la VLAN 10 (Hangar MedEvac).
  3. *Mitigación:* Ejecución en menos de 500 ms de una política ACL de bloqueo total en la interfaz de retorno (`lock_door_acl`) seguida de la terminación del proceso hostil activo en la subred frontal.
  4. *Prevención de Incidentes:* Microsegmentación definida por software (SDN) con cierre automático de compuertas lógicas ante cualquier anomalía de tráfico este-oeste.

#### EP12 — Secuestro del TF-22 Transfighter (`STEAL PLANE`)
* **Ubicación en Cyberia (1996):** Hangar principal de la plataforma *The Rig*, cabina del caza furtivo experimental **TF-22 Transfighter**.
* **Spoiler Completo de la Trama:** Zak corre hasta el caza experimental TF-22, sube a la cabina mientras los guardias disparan contra el fuselaje e introduce la secuencia de ignición y desbloqueo de los motores en la computadora de vuelo, despegando a toda potencia desde la rampa de la plataforma hacia el Ártico.
* **Contraparte en el SOC Hospitalario:** Aseguramiento de Unidad de Cuidados Intensivos Móvil / Ambulancia Aérea Autónoma (MedEvac TF-22) y Secuencia de *Secure Boot*.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0112` (CVSS 8.8) — Intento de denegación de arranque y secuestro del bus aviónico `ARINC 429` / telemetría UCI móvil durante la secuencia de inicialización en caliente.
  2. *Detección:* Verificación de cadena de confianza UEFI Secure Boot y monitoreo de integridad de los controladores de soporte vital de a bordo bajo fuego de paquetes maliciosos.
  3. *Mitigación:* Inyección de código de autorización maestro desde el implante BLADES para forzar el encendido de emergencia y desacoplar la nave de la red comprometida de la plataforma.
  4. *Prevención de Incidentes:* Arquitectura de control de vuelo y soporte vital con particionamiento estricto de tiempo y espacio (`ARINC 653`) inmune a interferencias de la red de hangar.

---

### ACTO II: RUTA DE EVACUACIÓN ÁRTICA Y TÚNELES DE SUMINISTRO (TELEMETRÍA EN TRÁNSITO)

#### EP13 — Rasante sobre el Mar de Barents (`ISLAND RUN`)
* **Ubicación en Cyberia (1996):** Islas heladas y aguas abiertas del Mar de Barents a bordo del TF-22.
* **Spoiler Completo de la Trama:** El TF-22 vuela de forma semiautónoma a ras del agua mientras Zak opera los cañones láser y misiles para destruir lanchas rápidas, helicópteros de ataque y estaciones de radar costeras del Cartel situadas en los islotes.
* **Contraparte en el SOC Hospitalario:** Protección de Enlaces Satelitales de Telemedicina en Tránsito contra Interferencia RF (*Jamming*) y Nodos Interceptores Marítimos.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0213` (CVSS 8.0) — Susceptibilidad del enlace satelital en banda Ku de telemedicina móvil a ataques de interferencia deliberada (*RF Jamming*) y suplantación de estaciones base costeras.
  2. *Detección:* Caída abrupta en la relación señal-ruido (SNR) e identificación de balizas falsas que intentan forzar un *downgrade* del cifrado del canal de signos vitales en vivo.
  3. *Mitigación:* Salto de frecuencia por espectro ensanchado (FHSS) automatizado y neutralización lógica de las estaciones base falsas mediante listas de bloqueo dinámicas.
  4. *Prevención de Incidentes:* Enlaces satelitales redundantes multi-órbita (LEO/GEO) con cifrado cuántico-resistente (PQC) para telemetría de pacientes en traslado.

#### EP14 — Cañón de Hielo y Baterías SAM (`VALLEY RUN`)
* **Ubicación en Cyberia (1996):** Desfiladeros estrechos de hielo y roca en la costa ártica.
* **Spoiler Completo de la Trama:** El TF-22 se interna a velocidad supersónica en un cañón glaciar para evadir los radares principales, pero el desfiladero está plagado de baterías de misiles tierra-aire (SAM) y cazas enemigos que Zak debe destruir antes de que impacten el escudo del avión.
* **Contraparte en el SOC Hospitalario:** Filtrado de Paquetes Maliciosos de Baja Latencia en Pasarelas de Borde (*Edge Medical Gateways*).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0214` (CVSS 8.5) — Desbordamiento de búfer en el analizador sintáctico de tramas `HL7 v2.5 MLLP` en los routers de borde cuando procesan ráfagas de paquetes fragmentados maliciosos.
  2. *Detección:* Motor IDS Snort/Suricata en el borde detectando firmas de *shellcode* inyectadas en segmentos `OBX` (Observaciones Clínicas) disparados en ráfaga como misiles SAM.
  3. *Mitigación:* Inspección y descarte en línea (*Inline IPS Drop*) de fragmentos malformados manteniendo la sesión TCP de telemetría legítima intacta.
  4. *Prevención de Incidentes:* Reemplazo de parsers legados en C por microservicios en memoria segura y validación estricta de esquemas HL7/FHIR en el perímetro.

#### EP15 — Turbulencia en la Tormenta Polar (`ROUGH RIDE`)
* **Ubicación en Cyberia (1996):** Espacio aéreo subpolar bajo una feroz tormenta de nieve nocturna.
* **Spoiler Completo de la Trama:** La visibilidad cae casi a cero debido a una ventisca ártica extrema mientras escuadrones de interceptores del Cartel atacan al TF-22 desde todos los ángulos; Zak depende del visor de puntería asistida para sobrevivir a la emboscada en medio de la turbulencia.
* **Contraparte en el SOC Hospitalario:** Resiliencia de Sensores Biométricos e Infusión Inteligente ante Ruido Electromagnético Extremo y Degradación de Red.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0215` (CVSS 7.7) — Pérdida de sincronización de reloj (`NTP Spoofing / Jitter`) e inyección de ruido electromagnético que provoca lecturas falsas de arritmia en monitores multiparamétricos.
  2. *Detección:* Algoritmos de filtrado adaptativo Kalman en el SOC que distinguen entre artefactos de ruido de tormenta y anomalías fisiológicas o ataques de inyección de señal.
  3. *Mitigación:* Activación de protocolo de sincronización determinista `IEEE 1588 PTP` con perfil de seguridad y conmutación a búferes locales de alta resiliencia en bombas de infusión.
  4. *Prevención de Incidentes:* Blindaje electromagnético (TEMPEST / IEC 60601-1-2) y validación cruzada de signos vitales mediante múltiples sensores independientes (ECG + SpO2 + Presión Arterial Invasiva).

#### EP16 — Puerto Militar de Arcángel (`PORT FLYBY`)
* **Ubicación en Cyberia (1996):** Instalaciones portuarias fortificadas de Archangel (Arcángel), norte de Rusia.
* **Spoiler Completo de la Trama:** El TF-22 sobrevuela a gran velocidad el puerto industrial controlado por el Cartel, lleno de grúas, buques de guerra y defensas pesadas. La computadora de vuelo avisa a Zak de un objetivo prioritario que brilla con energía **verde**: el generador de escudo principal de la base portuaria. Si Zak no destruye ese nodo verde en la pasada, las defensas destrozan el avión.
* **Contraparte en el SOC Hospitalario:** Identificación y Desmantelamiento de Servidor *C2 Sinkhole / Cortafuegos Inverso Malicioso* en el Nodo Logístico Portuario.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0216` (CVSS 9.2) — Servidor proxy inverso malicioso plantado en la red de cadena de suministro portuario que secuestra las actualizaciones de firmware de los equipos de imagenología del hospital.
  2. *Detección:* El escáner visual del SOC resalta en verde (`#00F200`) el nodo con entropía TLS anómala y certificado autofirmado que actúa como generador de escudo del tráfico C2 del Cartel.
  3. *Mitigación:* Ejecución de *Takedown* quirúrgico contra la IP/BGP del nodo C2 verde y revocación inmediata de su certificado intermedio en el almacén de confianza clínico.
  4. *Prevención de Incidentes:* Actualizaciones de firmware médico verificadas exclusivamente mediante repositorios firmados fuera de banda (TUF - *The Update Framework*).

#### EP17 — El Túnel Subterráneo de Carga (`UNDERGROUND`)
* **Ubicación en Cyberia (1996):** Túnel ferroviario y de camiones subterráneo que atraviesa las montañas hacia Siberia.
* **Spoiler Completo de la Trama:** Para infiltrarse bajo la red de radares rusos, el TF-22 se sumerge dentro de un estrecho túnel subterráneo de transporte a velocidad vertiginosa. Zak debe disparar a los convoys de camiones cisterna de combustible y trenes blindados dentro del túnel antes de chocar contra ellos o contra las columnas de soporte, provocando reacciones en cadena explosivas.
* **Contraparte en el SOC Hospitalario:** Protección del Bus Troncal Interno (*Hospital Backbone / CAN Bus de Transporte Neumático y AGVs*) contra Saturación y Explosión de Paquetes.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0217` (CVSS 8.7) — Inyección de tramas dominantes en el bus CAN de los robots autónomos de transporte hospitalario (AGVs) y del sistema de tubos neumáticos de muestras de sangre, causando colisiones y denegación de servicio física.
  2. *Detección:* Monitor de bus que detecta ráfagas de identificadores CAN de alta prioridad (`ID 0x000`) que actúan como camiones cisterna bloqueando el conducto de datos.
  3. *Mitigación:* Purga selectiva de tramas maliciosas en los repetidores del túnel troncal y aislamiento de los nodos AGV comprometidos antes de que saturen el ancho de banda.
  4. *Prevención de Incidentes:* Implementación de CANsec / MACsec en todo el backbone subterráneo del hospital y limitación de tasa por hardware en controladores de transporte.

#### EP18 — Parada de Emergencia en el Búnker (`PIT STOP`)
* **Ubicación en Cyberia (1996):** Caverna búnker oculta a mitad del túnel subterráneo.
* **Spoiler Completo de la Trama:** Con los escudos del TF-22 al límite tras el cruce del túnel, la nave realiza una parada técnica de emergencia en una bahía subterránea automatizada para recargar energía de los escudos y ejecutar el autodiagnóstico de los sistemas de armas antes del asalto final sobre la superficie siberiana.
* **Contraparte en el SOC Hospitalario:** Conmutación por Error (*Failover*) a Subestación de Generadores Diésel, Bancos de Baterías UPS de Quirófano y Autodiagnóstico de Integridad.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0218` (CVSS 8.3) — Manipulación de los registros SNMP (`private` community string por defecto) en las unidades UPS de soporte vital que reportan carga falsa del 100% cuando las baterías están agotadas.
  2. *Detección:* Prueba de carga real bajo demanda durante el *Pit Stop* que compara la caída de tensión física medida por el bus analógico con el valor reportado por SNMPv1/v2c.
  3. *Mitigación:* Deshabilitación de SNMP legado, migración instantánea a SNMPv3 con cifrado AES-256 y transferencia controlada de carga a los generadores de respaldo verificados.
  4. *Prevención de Incidentes:* Pruebas automatizadas de transferencia de energía sin interrupción (*Zero-Transfer-Time UPS*) auditadas criptográficamente cada 24 horas.

#### EP19 — Glaciares de Aproximación a Siberia (`ICE SCREAM`)
* **Ubicación en Cyberia (1996):** Salida del túnel hacia los cañones glaciares de Siberia Oriental, perímetro exterior del Complejo Cyberia.
* **Spoiler Completo de la Trama:** El TF-22 emerge a la superficie helada de Siberia y enfrenta la última y más densa barrera de defensas aéreas, torretas ocultas en el hielo y cazas de élite del Cartel antes de alcanzar la zona de aterrizaje del complejo secreto.
* **Contraparte en el SOC Hospitalario:** Defensa de los Sistemas HVAC de Ultracongelación, Criogenia y Banco de Sangre ante Ataques de Denegación de Servicio Térmico.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0219` (CVSS 9.0) — Explotación de controladores BACnet/IP en las plantas enfriadoras (*Chillers*) del hospital para alterar los puntos de consigna térmicos y descongelar el banco de sangre y muestras criogénicas.
  2. *Detección:* Correlación de alertas térmicas físicas con comandos `WriteProperty` no autorizados dirigidos a los objetos `AnalogValue` de temperatura en la red de climatización.
  3. *Mitigación:* Bloqueo por hardware de los termostatos de seguridad criogénica y filtrado estricto de tráfico BACnet en el firewall industrial del sector Siberia.
  4. *Prevención de Incidentes:* Termostatos mecánicos de respaldo independientes de la red IP y arquitectura de control climático con doble bucle redundante.

---

### ACTO III: COMPLEJO CYBERIA - NIVEL 1 (PERÍMETRO CLÍNICO, QUIRÓFANOS LÁSER Y ADMISIONES)

#### EP20 — Aterrizaje en la Tundra (`COLD FEET`)
* **Ubicación en Cyberia (1996):** Explanada nevada exterior frente a las puertas blindadas del Complejo Cyberia en Siberia.
* **Spoiler Completo de la Trama:** El TF-22 aterriza en la nieve. Zak desciende a pie bajo el frío glacial y se encuentra ante una bifurcación crítica del perímetro: intentar entrar por el acceso principal norte fuertemente custodiado o buscar la puerta trasera de mantenimiento con cerradura electrónica.
* **Contraparte en el SOC Hospitalario:** Reconocimiento Perimetral y Auditoría de Vectores de Entrada Físicos y Lógicos al Campus Hospitalario Principal.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0320` (CVSS 7.6) — Coexistencia de un portal público de admisiones expuesto a fuerza bruta (Entrada Norte) y una interfaz de diagnóstico de mantenimiento con lógica cableada predecible (Puerta Trasera).
  2. *Detección:* Escaneo de superficie de ataque externa (EASM) mediante el visor BLADES que cartografía ambos vectores de entrada y evalúa el riesgo operativo de cada ruta.
  3. *Mitigación:* Endurecimiento (*Hardening*) simultáneo del portal frontal mediante WAF y deshabilitación de interfaces de mantenimiento expuestas sin túnel previo.
  4. *Prevención de Incidentes:* Reducción de superficie de ataque externa eliminando puertos de diagnóstico legados y unificando el control de acceso bajo un único gateway certificado.

#### EP21 — Duelo en el Acceso Norte (`DOOR MAN`)
* **Ubicación en Cyberia (1996):** Puerta principal norte del Complejo Cyberia.
* **Spoiler Completo de la Trama:** Si Zak decide ir por la entrada norte, un guardia pesado con armadura térmica emerge de la compuerta y abre fuego con un rifle de plasma. Zak debe ocultarse tras el pilar de concreto y disparar con sincronización perfecta entre las ráfagas del centinela para abatirlo y cruzar la puerta.
* **Contraparte en el SOC Hospitalario:** Neutralización de Ataques de Fuerza Bruta y *Credential Stuffing* en el Concentrador VPN del Personal Médico.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0321` (CVSS 8.4) — Ausencia de bloqueo adaptativo por tasa (*Rate Limiting*) en el concentrador VPN SSL del hospital, permitiendo ráfagas masivas de autenticación hostil.
  2. *Detección:* Detección de ráfagas periódicas de fallos de autenticación (`HTTP 401 / RADIUS Access-Reject`) sincronizadas desde un nodo atacante blindado tras proxies residenciales.
  3. *Mitigación:* Contraataque activo mediante *Tarpitting* TCP, bloqueo dinámico de IP por reputación y exigencia de certificado de cliente mutuo (mTLS) antes de procesar credenciales.
  4. *Prevención de Incidentes:* Eliminación de VPNs basadas en contraseña en favor de acceso sin contraseña (*Passwordless FIDO2*) y certificados de dispositivo gestionados por MDM clínico.

#### EP22 — Compuerta Lógica del Perímetro (`LOCKED OUT`)
* **Ubicación en Cyberia (1996):** Puerta trasera de mantenimiento del Complejo Cyberia (Nivel 1 Exterior).
* **Spoiler Completo de la Trama:** Frente a la cerradura electrónica bloqueada, Zak activa el **Escáner de Resonancia Magnética (MRI)** de su implante BLADES para ver a través de la carcasa metálica. En el interior aparece un circuito de **puertas lógicas (`AND`, `OR`, `NOT`)** con tres interruptores de entrada. Zak debe conmutar los nodos de entrada en la combinación booleana exacta para que la señal de energía llegue al solenoide final sin disparar la alarma ni fundir el circuito.
* **Contraparte en el SOC Hospitalario:** Auditoría de Firmware y Verificación Formal de Compuertas Lógicas en PLCs de Esclusas de Quirófano y Gases Medicinales (*BLADES MRI Gate Solver*).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0322` (CVSS 8.9) — Alteración maliciosa de la lógica de escalera (*Ladder Logic / IEC 61131-3*) en el PLC de la esclusa quirúrgica que invierte una compuerta `NOT` para permitir la apertura simultánea de ambas puertas y romper la presión positiva del quirófano.
  2. *Detección:* Inspección mediante el simulador MRI de BLADES del grafo booleano en memoria del PLC, detectando la discrepancia entre la tabla de verdad esperada y los estados de los registros de entrada (`I0.0`, `I0.1`, `I0.2`).
  3. *Mitigación:* Reconfiguración en vivo de los vectores de entrada booleanos para restaurar el estado lógico `TRUE` seguro en el actuador de bloqueo y reflasheo de la lógica verificada.
  4. *Prevención de Incidentes:* Verificación formal matemática de programas PLC antes de su despliegue en quirófanos y bloqueo físico mediante llave del selector `RUN/PROG` del controlador.

#### EP23 — El Cuarto Oscuro y la Trampa Láser (`SLICEOMATIC`)
* **Ubicación en Cyberia (1996):** Sala de seguridad oscura inmediatamente detrás de la puerta trasera del Nivel 1.
* **Spoiler Completo de la Trama:** Al entrar en la habitación en penumbras, Zak ve una segunda puerta cerrada con un panel numérico. Si el jugador intenta manipular esa cerradura secundaria sin haber desactivado antes el sistema de seguridad, se activa la trampa mortal `SLICEOMATIC`: una matriz de haces láser quirúrgicos de alta potencia desciende del techo y rebana el cuerpo de Zak en pedazos instantáneamente.
* **Contraparte en el SOC Hospitalario:** Sistemas de Seguridad Intrínseca (*Hardware Interlocks*) en Equipos de Radioterapia (Aceleradores Lineales LINAC) y Cirugía Láser Robótica.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0323` (CVSS 9.8) — Bypass por software de los interbloqueos de dosimetría y posicionamiento en el robot de cirugía láser/radioterapia (similar en criticidad a un fallo tipo *Therac-25*), permitiendo una descarga letal ante un comando no autorizado.
  2. *Detección:* Monitoreo de registros de estado del controlador láser que detecta el armado de los capacitores de alta potencia (`LASER_GRID_ARMED = 1`) sin que exista un token válido de sesión quirúrgica autorizada.
  3. *Mitigación:* Disparo inmediato del relé electromecánico de corte físico de energía (*Hardwired E-Stop*) y bloqueo del intento de acceso no autorizado al panel secundario.
  4. *Prevención de Incidentes:* Interbloqueos de seguridad cableados por hardware (*Hardwired Safety Interlocks* según IEC 60601-2-22) que ningún comando de software o malware pueda puentear jamás.

#### EP24 — Tiroteo en el Comedor de Guardia (`NOT FRIENDS`)
* **Ubicación en Cyberia (1996):** Comedor y área de descanso de los guardias en el Nivel 1 del Complejo Cyberia.
* **Spoiler Completo de la Trama:** Zak irrumpe en el comedor donde cuatro guardias del Cartel están reunidos. Es una emboscada letal: Zak debe disparar rápidamente a los dos primeros guardias a la izquierda de las mesas y rodar de inmediato tras las cajas de suministros para cubrirse del fuego cruzado y abatir a los dos guardias restantes.
* **Contraparte en el SOC Hospitalario:** Contención de Brote de Malware Polimórfico en la Red Wi-Fi de Áreas Comunes, Cafetería y Descanso Médico.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0324` (CVSS 8.6) — Salto de VLAN desde la red BYOD de descanso del personal médico hacia la subred clínica interna mediante explotación de vulnerabilidad WPA3 Dragonblood / desbordamiento en controlador Wi-Fi.
  2. *Detección:* Detección de cuatro beacons de comando y control (C2) simultáneos originados en dispositivos móviles infectados dentro del comedor que intentan escanear el servidor central.
  3. *Mitigación:* Cuarentena en dos fases: neutralización inmediata de los dos primeros nodos activos mediante * quarantine VLAN*, activación de escudo de filtrado en el switch de piso y erradicación de los dos nodos persistentes restantes.
  4. *Prevención de Incidentes:* Aislamiento físico total (redes separadas sin enrutamiento compartido) entre la red Wi-Fi de invitados/descanso y las redes de dispositivos médicos e historia clínica.

#### EP25 — El Holograma del Escritorio y Espionaje (`LISTEN IN`)
* **Ubicación en Cyberia (1996):** Oficinas administrativas y despacho de diseño del Nivel 1.
* **Spoiler Completo de la Trama:** Zak entra en una oficina vacía donde un proyector holográfico sobre el escritorio muestra los planos tridimensionales giratorios del proyecto Cyberia. Al oír pasos, Zak se esconde en las sombras detrás de una columna estructural y escucha en completo silencio a dos científicos hablar sobre las pruebas biológicas letales en el subsuelo y mencionar pistas vitales sobre la terminal de la sala de conferencias.
* **Contraparte en el SOC Hospitalario:** Captura Pasiva de Tráfico (*Network Tap / SPAN Port Mirroring*) para Detectar Exfiltración de Propiedad Intelectual Biomédica y Credenciales en Texto Claro.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0325` (CVSS 7.9) — Transmisión de modelos 3D DICOM de investigación genética y credenciales administrativas a través de protocolos sin cifrar (`Telnet`, `FTP`, `HTTP` plano) en la subred de oficinas.
  2. *Detección:* Sonda pasiva *Stealth Network Tap* (modo `LISTEN IN` sin dirección IP ni respuesta ARP) que reconstruye el flujo TCP de la conversación entre las estaciones de trabajo científicas sin alertar a los atacantes.
  3. *Mitigación:* Extracción de inteligencia de amenazas (IoCs y rutas de acceso al Nivel 2) a partir del tráfico capturado y revocación silenciosa de las credenciales expuestas.
  4. *Prevención de Incidentes:* Cifrado obligatorio de extremo a extremo (`DICOM TLS`, `HTTPS/HSTS`, `SSHv2`) en todas las comunicaciones internas del hospital e inspección continua mediante sensores NDR pasivos.

#### EP26 — Sala de Conferencias y la Terminal de Símbolos (`GENIUS`)
* **Ubicación en Cyberia (1996):** Sala de juntas ejecutiva del Nivel 1, equipada con la supercomputadora administrativa.
* **Spoiler Completo de la Trama:** Zak revisa los dossieres confidenciales sobre la mesa de conferencias y se sienta frente a la terminal maestra. Al intentar acceder al sistema de control del ascensor de carga, se activa el desafío de seguridad `GENIUS`: una matriz de **símbolos geométricos de colores** (flecha azul hacia abajo, círculo rojo partido, cuadrado rojo, triángulo azul) con tres niveles de dificultad creciente y un temporizador regresivo mortal. Si el jugador no deduce la secuencia lógica de símbolos antes de que se agote el tiempo, la silla de la terminal descarga un pulso letal que mata a Zak.
* **Contraparte en el SOC Hospitalario:** Desactivación Contrarreloj de Bomba Lógica Criptográfica (*Cryptographic Logic Bomb*) en el Servidor Maestro de Historias Clínicas (HIS).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0326` (CVSS 9.5) — Bomba lógica plantada en el motor de base de datos del HIS que exige una secuencia de desafíos criptográficos de 3 etapas antes de ejecutar un `DROP/WIPE` irreversible de los registros de pacientes y bloquear los controles del edificio.
  2. *Detección:* Análisis simbólico en tiempo real por el motor BLADES de las permutaciones de estado de la máquina de estados finitos (`FSM-GENIUS-3LVL`) en la memoria del servidor central.
  3. *Mitigación:* Inyección automatizada de los 3 vectores de respuesta simbólica correctos antes del vencimiento del *watchdog timer*, desarmando el disparador destructivo y liberando los permisos de control del montacargas.
  4. *Prevención de Incidentes:* Monitoreo de integridad de archivos (FIM) y procedimientos almacenados en la base de datos clínica junto con control de cambios con aprobación criptográfica múltiple.

#### EP27 — Desbloqueo del Montacargas al Subsuelo (`Crate Override`)
* **Ubicación en Cyberia (1996):** Almacén de tránsito del Nivel 1 junto al elevador de carga oculto.
* **Spoiler Completo de la Trama:** Con los bloqueos electrónicos liberados desde la terminal `GENIUS`, Zak regresa al pasillo de carga, empuja físicamente una enorme caja de suministros que ocultaba la entrada secreta, abre la compuerta y desciende en el montacargas hacia los laboratorios subterráneos del Nivel 2.
* **Contraparte en el SOC Hospitalario:** Desbloqueo de Rutas de Evacuación Clínica y Rehabilitación del Bus de Control de Montacargas Quirúrgicos y Suministros Estériles.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0327` (CVSS 7.4) — Obstrucción combinada física y lógica (bloqueo de actuadores PLC + denegación de ruta en el sistema de gestión de almacenes WMS) que impide el descenso a los laboratorios de biocontención.
  2. *Detección:* Discrepancia entre los sensores ópticos de presencia de carga y el estado del registro de habilitación del elevador emitida tras la resolución de la terminal `GENIUS`.
  3. *Mitigación:* Ejecución de *Manual Override* autenticado sobre el controlador del montacargas y restablecimiento del enlace de telemetría con el subsuelo (Nivel 2).
  4. *Prevención de Incidentes:* Protocolos de desbloqueo de emergencia a prueba de fallos (*Fail-Safe Mechanical & Logical Override*) en todas las vías verticales de evacuación hospitalaria.

---
### ACTO IV: COMPLEJO CYBERIA - NIVEL 2 (LABORATORIOS DE BIOCONTENCIÓN, GAS HALÓN Y NANOMEDICINA)

#### EP28 — El Guardia del Ventanal y el Gas Halón (`RED LIGHT`)
* **Ubicación en Cyberia (1996):** Almacén inferior del Nivel 2 vigilado desde una cabina acristalada elevada.
* **Spoiler Completo de la Trama:** Al salir del montacargas en el Nivel 2, Zak debe cruzar un almacén observado por un científico/guardia a través de un gran ventanal. El guardia baja la vista periódicamente para leer su portapapeles y luego vuelve a mirar hacia el almacén. Si Zak se mueve cuando el guardia está mirando, se enciende la alarma roja (`RED LIGHT`), las puertas se sellan herméticamente y la habitación se inunda de **gas Halón** letal para extinción de incendios, asfixiando a Zak hasta la muerte. Zak debe avanzar sincronizándose con los segundos exactos en que el guardia baja la cabeza.
* **Contraparte en el SOC Hospitalario:** Seguridad en Sistemas SCADA de Supresión de Incendios por Gas Halón/FM-200 y Control de Gases Medicinales (Oxígeno/Nitrógeno) en Salas Críticas.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0428` (CVSS 9.7) — Accionamiento remoto sin retardo ni verificación de presencia humana del sistema de descarga de gas Halón en salas cerradas con personal o pacientes, provocando hipoxia letal instantánea.
  2. *Detección:* Monitoreo de ciclos de sondeo (*Polling Interval Timing*) del controlador de vigilancia y alerta crítica ante cualquier comando de pre-descarga en las válvulas solenoides de Halón.
  3. *Mitigación:* Inyección de tráfico sincronizado con las ventanas ciegas del *polling* del sensor hostil y bloqueo electrónico de la electroválvula principal de descarga de gas Halón.
  4. *Prevención de Incidentes:* Doble validación física (detector óptico + térmico cruzado), retardo mecánico obligatorio de evacuación de 60 segundos y bloqueo manual físico (*Abort Switch*) antes de cualquier liberación de agentes limpios.

#### EP29 — Ejecución en el Laboratorio de Observación (`Glass Room Breach`)
* **Ubicación en Cyberia (1996):** Cabina de observación acristalada del Nivel 2.
* **Spoiler Completo de la Trama:** Tras cruzar el almacén sin activar el gas Halón, Zak rodea el corredor lateral, abre la puerta de la cabina de observación donde se encuentra el guardia del ventanal, se esconde rápidamente tras un armario cuando el guardia se gira y luego lo abate antes de que pueda presionar el botón de alarma química.
* **Contraparte en el SOC Hospitalario:** Neutralización de Sesión Fantasma de Atacante (*Session Hijacking / Rogue Operator*) en la Consola Central de Monitoreo de Cuidados Intensivos.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0429` (CVSS 8.5) — Consola de enfermería/observación con sesión privilegiada desatendida y privilegios directos de activación de alarmas químicas y bloqueo de planta.
  2. *Detección:* Detección de proceso vigilante hostil (`halon_watcher.daemon`) ejecutándose en primer plano en la estación de trabajo de la cabina de observación.
  3. *Mitigación:* Terminación sigilosa del proceso vigilante (`SIGKILL`) desde una sesión administrativa lateral antes de que el operador hostil logre emitir el trap SNMP de emergencia.
  4. *Prevención de Incidentes:* Bloqueo automático de sesión por proximidad (balizas Bluetooth/UWB de gafete médico) y revocación de permisos de control ambiental en estaciones de observación clínica.

#### EP30 — Terminal V-Mail y Estado de Pacientes (`Patient Status Terminal`)
* **Ubicación en Cyberia (1996):** Laboratorio de registros médicos y comunicaciones internas del Nivel 2.
* **Spoiler Completo de la Trama:** Con el operador neutralizado, Zak accede a la computadora del laboratorio y revisa los mensajes de vídeo y texto internos (**V-Mail**) de los científicos del Cartel, junto con las fichas clínicas de los sujetos de prueba expuestos a un virus experimental mortal. Desde esta misma terminal, Zak ejecuta el comando para destrabar las rejillas del sistema de conductos de ventilación.
* **Contraparte en el SOC Hospitalario:** Auditoría Forense de Logs de Acceso a Datos Sensibles de Pacientes (Cumplimiento HIPAA / GDPR Clínico) y Control de Compuertas HVAC de Presión Negativa.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0430` (CVSS 8.8) — Almacenamiento de historias clínicas de sujetos infectados y correos internos (`V-Mail`) en la misma estación que controla los actuadores de las compuertas de ventilación biocontenida.
  2. *Detección:* Análisis forense de la tabla de auditoría clínica (`AuditEvent FHIR`) que revela experimentos biológicos no autorizados y correlación con comandos de apertura de ductos HVAC.
  3. *Mitigación:* Extracción forense íntegra de los buzones `V-Mail` como evidencia criptográfica firmada y reconfiguración controlada de las compuertas de ventilación para permitir el paso seguro del auditor.
  4. *Prevención de Incidentes:* Separación absoluta entre las estaciones de trabajo de correo/historias clínicas (IT) y los controladores de presión negativa y ventilación de biocontención (OT/BMS).

#### EP31 — Infiltración por los Conductos de Aire (`Ventilation Shaft Keycard`)
* **Ubicación en Cyberia (1996):** Red de ductos de ventilación metálicos entre la sala del ascensor y los laboratorios cerrados del Nivel 2.
* **Spoiler Completo de la Trama:** Zak regresa a la antesala del ascensor, retira la rejilla de ventilación del suelo que acaba de desbloquear desde la terminal, se arrastra por el estrecho conducto de aire hasta una rejilla contigua y extiende la mano para tomar la **tarjeta magnética de acceso (Keycard)** que reposa al otro lado de la puerta bloqueada.
* **Contraparte en el SOC Hospitalario:** Prevención de Salto de Redes Aisladas (*Air-Gap Bypass*) y Custodia de Tarjetas Inteligentes Criptográficas (PIV / SmartCards) del Personal Clínico.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0431` (CVSS 8.4) — Falsa sensación de seguridad por aislamiento lógico (*Air-Gap*) vulnerada mediante un puente secundario no monitoreado (conducto de mantenimiento) que permite sustraer una tarjeta criptográfica de alto privilegio.
  2. *Detección:* Sensores volumétricos y de flujo laminar en los ductos de aire limpio que detectan una caída de presión diferencial y la activación del chip RFID de la tarjeta maestra fuera de su lector asignado.
  3. *Mitigación:* Registro del identificador único (`UID`) de la tarjeta recuperada en el motor BLADES para autorizar el cruce controlado hacia el sector de nanomedicina sin disparar el bloqueo general.
  4. *Prevención de Incidentes:* Rejillas de seguridad física en ductos HVAC con sensores de fibra óptica anti-intrusión y tarjetas inteligentes que requieren PIN biométrico además de posesión física.

#### EP32 — El Pasillo Rojo y la Sala Plateada (`Silver Room Perimeter`)
* **Ubicación en Cyberia (1996):** Corredor iluminado en rojo y cámara plateada de contención en el Nivel 2.
* **Spoiler Completo de la Trama:** Usando la tarjeta magnética, Zak avanza por los pasillos de alta seguridad teñidos de luz roja de alerta y se enfrenta a los guardias de bioseguridad. En este sector existe una llamativa **sala plateada**; si el jugador entra en ella sin haber completado los pasos previos o se queda atrapado dentro, descubre que es un callejón sin salida mortal diseñado para encerrar intrusos.
* **Contraparte en el SOC Hospitalario:** Despliegue de *Honeypots Clínicos de Alta Interacción* (Cámaras y Servidores Señuelo) para Atraer, Aislar y Analizar Intrusos sin Comprometer Pacientes Reales.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0432` (CVSS 7.8) — Rutas de red engañosas y subredes señuelo que simulan ser servidores PACS/DICOM críticos (la "Sala Plateada") para atrapar procesos de reconocimiento automatizado.
  2. *Detección:* El escáner de topología de BLADES identifica que la subred `SILVER_ROOM_VLAN_99` carece de tráfico fisiológico real y posee trampas de enrutamiento (*Blackhole / Sinkhole*).
  3. *Mitigación:* Evasión de la trampa para el operador legítimo del SOC mientras se redirige el tráfico de los guardias/atacantes hostiles hacia el interior del Honeypot plateado para su contención total.
  4. *Prevención de Incidentes:* Arquitectura de *Deception Technology* clínica distribuida con señuelos que emulan bombas de infusión y servidores FHIR falsos para detectar movimiento lateral temprano.

#### EP33 — La Consola de Nanomedicina (`DRUG STORE`)
* **Ubicación en Cyberia (1996):** Laboratorio de Nanomedicina y Microbiología del Nivel 2 (`DRUG STORE`).
* **Spoiler Completo de la Trama:** Una alarma biológica anuncia que el complejo inferior está contaminado con un virus letal de acción rápida. Zak se sienta en la consola médica del laboratorio, donde aparecen **3 compuestos/antídotos experimentales**. Al seleccionar el correcto, la pantalla cambia a un visor microscópico en tiempo real: Zak debe operar el cañón médico microscópico y **disparar a las cepas del virus en sangre** mientras se multiplican en la pantalla, sintetizando así el código y la dosis del antídoto salvavidas.
* **Contraparte en el SOC Hospitalario:** Consola Interactiva **Nanomedicine EDR/XDR Inoculator** — Neutralización en Tiempo Real de Cepas de Ransomware y Rootkits en el Kernel de Bombas de Infusión Inteligentes.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0433` (CVSS 10.0) — Infección por gusano bio-digital / ransomware polimórfico (`CYBERIA-STRAIN-X`) que altera las tasas de dosificación de fármacos vasoactivos en las bombas de infusión UCI y se replica cada segundo en memoria.
  2. *Detección:* Visor microscópico de memoria kernel (EDR Live Heuristics) que visualiza los hilos maliciosos mutantes (`#00F200`) intentando corromper las células/procesos legítimos de soporte vital.
  3. *Mitigación:* Selección de la firma de vacuna exacta entre los 3 perfiles heurísticos e inyección activa de micro-parches en memoria (*Live Kernel Patching*) destruyendo cada instancia viral antes de que alcance la masa crítica.
  4. *Prevención de Incidentes:* Ejecución de código en enclaves seguros, listas blancas de procesos inmutables en dispositivos médicos Clase III y motores EDR ligeros embebidos en el RTOS biomédico.

#### EP34 — Cruce de la Zona Contaminada e Inoculador (`UNSAFE DOOR`)
* **Ubicación en Cyberia (1996):** Corredor biológico contaminado y cámara de inoculación del Nivel 2.
* **Spoiler Completo de la Trama:** Zak cruza la puerta sellada con advertencia de peligro biológico (`UNSAFE DOOR`) hacia el sector infectado. Apenas entra, el virus ataca su organismo y su barra de salud/energía comienza a vaciarse rápidamente. Zak debe correr contra la muerte hasta la terminal de bio-purga, introducir el código del antídoto sintetizado en `DRUG STORE` y subirse de inmediato a la plataforma circular del **Inoculador**, donde un haz de energía médica barre su cuerpo y purga el virus por completo.
* **Contraparte en el SOC Hospitalario:** Ejecución de Protocolo de Cuarentena en Zona Roja, Desinfección Criptográfica de Endpoints Comprometidos y Restauración de Signos Vitales desde Imágenes Inmutables.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0434` (CVSS 9.6) — Degradación acelerada de recursos de CPU/batería y corrupción progresiva de almacenamiento en dispositivos médicos que operan dentro de una VLAN biológicamente/digitalmente contaminada.
  2. *Detección:* Telemetría de signos vitales de Zak/Endpoint mostrando caída vertical de integridad (`HP/Integrity < 25%`) por acción del payload viral activo en la Zona Roja.
  3. *Mitigación:* Ingreso del token criptográfico de vacuna generado en el episodio 33 y activación del *Inoculator Pod* para purgar la memoria RAM, restablecer los registros limpios y restaurar la salud del nodo al 100%.
  4. *Prevención de Incidentes:* Cámaras de desinfección lógica automatizada (*Cleanroom Provisioning Pods*) con imágenes doradas (*Golden Images*) almacenadas en memoria ROM de solo lectura.

#### EP35 — Escaneo MRI de las Bombas Hidráulicas (`GRAFFITI`)
* **Ubicación en Cyberia (1996):** Interior del ascensor de acceso profundo hacia el núcleo del complejo, bloqueado por un fallo hidráulico.
* **Spoiler Completo de la Trama:** Dentro del elevador detenido, Zak observa una pared interior cubierta de extrañas marcas/grafitis industriales. Al activar el **Escáner MRI** del implante BLADES para mirar a través de la placa metálica, descubre el sistema de **4 válvulas hidráulicas secundarias y 1 bomba maestra central**. Si intenta activar la bomba central primero, el sistema falla; Zak debe abrir y alinear las 4 válvulas periféricas en el orden correcto y finalmente activar la bomba central para presurizar el circuito y descender al núcleo.
* **Contraparte en el SOC Hospitalario:** Calibración y Aseguramiento por Escaneo MRI de Bombas de Circulación Extracorpórea (ECMO), Hemodiálisis y Presión Hidráulica Crítica (*BLADES Hydraulic Valve Solver*).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0435` (CVSS 9.4) — Sabotaje en la secuencia de válvulas proporcionales de bombas de perfusión extracorpórea (ECMO) y sistemas hidráulicos de contención; activar el impulsor principal con las 4 válvulas periféricas cerradas provoca sobrepresión destructiva o embolia gaseosa.
  2. *Detección:* Escaneo de resonancia magnética (MRI) de BLADES que revela el estado interno oculto de los 4 solenoides de válvula (`V1..V4 = CLOSED`) frente al comando prematuro del motor central (`MAIN_PUMP`).
  3. *Mitigación:* Secuenciación asistida que fuerza la apertura verificada de las 4 válvulas periféricas (`V1 -> V2 -> V3 -> V4 = OPEN`) antes de energizar la bomba maestra, logrando una presurización laminar segura.
  4. *Prevención de Incidentes:* Lógica de enclavamiento secuencial en el firmware de bombas ECMO y de diálisis que impide físicamente el arranque del rotor principal sin confirmación de flujo en los 4 sensores de línea.

---

### ACTO V: EL NÚCLEO BIOCIBERNÉTICO Y LA REVELACIÓN DEL PROYECTO CYBERIA (SIMBIOSIS Y PURGA)

#### EP36 — El Laboratorio Criogénico Subterráneo (`Cryo-Stasis Chamber`)
* **Ubicación en Cyberia (1996):** Bóvedas criogénicas profundas en el nivel más bajo del Complejo Cyberia.
* **Spoiler Completo de la Trama:** El ascensor hidráulico deposita a Zak en las silenciosas cámaras subterráneas donde se conservan en estasis criogénica los tejidos y prototipos biomecánicos del proyecto Cyberia bajo temperaturas extremas.
* **Contraparte en el SOC Hospitalario:** Monitoreo de Telemetría Térmica en Ultracongeladores (`-80 °C` / Nitrógeno Líquido `-196 °C`) de Biobanco Genético, Órganos para Trasplante y Vacunas de ARNm.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0536` (CVSS 8.8) — Ataque de repetición (*Replay Attack*) sobre los sensores de temperatura PT100/Modbus de las cápsulas de criopreservación para ocultar una pérdida de nitrógeno líquido.
  2. *Detección:* El sensor infrarrojo térmico de BLADES compara la radiación infrarroja real de las bóvedas con la telemetría digital reportada al panel del SOC.
  3. *Mitigación:* Sello criptográfico con marca de tiempo (*Timestamped Nonce*) en cada lectura térmica y activación de inyección auxiliar de nitrógeno líquido.
  4. *Prevención de Incidentes:* Sensores térmicos doblemente independientes con transmisión por fibra óptica inmune a manipulación en la red local.

#### EP37 — Interceptación de Telemetría de Zimmer (`Scientist Dossier`)
* **Ubicación en Cyberia (1996):** Consola central de investigación del Dr. Zimmer en el laboratorio del núcleo.
* **Spoiler Completo de la Trama:** Zak accede a los archivos maestros del **Dr. Zimmer**, el científico jefe detrás del proyecto, y descubre la verdad sobre el arma "Cyberia": no es una ojiva nuclear ni química convencional, sino una **entidad biomecánica viviente** (mitad caza espacial furtivo, mitad organismo cibernético autorreplicante) cultivada mediante nanotecnología avanzada que requiere un huésped humano genéticamente compatible para despertar.
* **Contraparte en el SOC Hospitalario:** Detección y Análisis Forense de Amenaza Persistente Avanzada (APT) Basada en Código Bio-Sintético Autónomo e IA Mutante.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0537` (CVSS 9.9) — Despliegue de arquitectura neural autónoma capaz de reescribir su propio código binario y adaptarse a las contramedidas convencionales del hospital como un organismo vivo.
  2. *Detección:* Decompilación heurística de los dossieres del Dr. Zimmer que expone el grafo genético-digital de la entidad Cyberia y sus requisitos de acoplamiento neuronal.
  3. *Mitigación:* Actualización inmediata de la base de conocimiento del SOC para tratar el artefacto no como malware estático, sino como un sistema autónomo simbiótico.
  4. *Prevención de Incidentes:* Gobernanza de IA clínica y controles de bioseguridad digital sobre cualquier modelo autoevolutivo entrenado en laboratorios hospitalarios.

#### EP38 — Neutralización de la Guardia de Élite del Núcleo (`Core Security Purge`)
* **Ubicación en Cyberia (1996):** Anillo blindado interior que protege la cámara de gestación del arma Cyberia.
* **Spoiler Completo de la Trama:** Los últimos soldados de élite del Cartel lanzan un ataque desesperado para impedir que Zak cruce hacia el hangar del reactor; Zak los abate en un intenso tiroteo final dentro de los corredores del búnker.
* **Contraparte en el SOC Hospitalario:** Revocación Masiva de Certificados Digitales Comprometidos (PKI CRL/OCSP Stapling) y Purga de Cuentas de Dominio Controladas por el Cartel.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0538` (CVSS 9.1) — Persistencia de tickets Kerberos dorados (*Golden Tickets*) y certificados de administrador de dominio emitidos por una autoridad certificadora subordinada secuestrada.
  2. *Detección:* Detección de intentos de autenticación Kerberos con tiempos de vida anómalos y firmas de cifrado pertenecientes al grupo de élite del Cartel en el anillo del núcleo.
  3. *Mitigación:* Doble rotación de la clave de la cuenta `krbtgt`, publicación instantánea de listas de revocación de certificados (CRL) y expulsión forzosa de todas las sesiones activas hostiles.
  4. *Prevención de Incidentes:* Arquitectura de administración sin privilegios permanentes (*Zero Standing Privileges - ZSP*) y validación de certificados mediante hardware HSM.

#### EP39 — Desactivación de Esclusas Biológicas Nivel 4 (`BSL-4 Airlock`)
* **Ubicación en Cyberia (1996):** Compuerta de biocontención de máxima seguridad que da acceso directo al reactor de la entidad Cyberia.
* **Spoiler Completo de la Trama:** Con los guardias eliminados, Zak opera los controles de despresurización de la gigantesca esclusa blindada Nivel 4; los cerrojos neumáticos se retraen entre nubes de vapor criogénico, abriendo el camino hacia el corazón del complejo.
* **Contraparte en el SOC Hospitalario:** Verificación de Integridad de Plataforma Segura (TPM 2.0) y Control de Presión Diferencial en Esclusas de Biocontención Nivel 4 (BSL-4).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0539` (CVSS 9.3) — Riesgo de pérdida de cascada de presión negativa (`-50 Pa`) durante la apertura de la esclusa maestra del laboratorio BSL-4 si los sensores neumáticos son manipulados.
  2. *Detección:* Verificación de los registros PCR (*Platform Configuration Registers*) del chip TPM 2.0 de la esclusa y monitoreo continuo de manómetros diferenciales láser.
  3. *Mitigación:* Secuencia de despresurización escalonada validada criptográficamente con purga de aire mediante filtros HEPA dobles antes de retraer los cerrojos principales.
  4. *Prevención de Incidentes:* Enclavamientos neumáticos redundantes y auditoría inmutable de cada ciclo de apertura de puertas BSL-4.

#### EP40 — El Descubrimiento del Traidor Devlin (`FWA Telemetry Leak`)
* **Ubicación en Cyberia (1996):** Antena de comunicaciones internas y puente de observación del reactor Cyberia.
* **Spoiler Completo de la Trama:** Antes de tocar el arma, las comunicaciones interceptadas revelan el **gran giro argumental del juego**: **William Devlin** (el líder de la FWA que liberó a Zak en el Episodio 1) es el verdadero villano maestro. Devlin nunca quiso destruir el proyecto Cyberia ni salvar al mundo; utilizó a Zak como un peón desechable para exterminar a los soldados del Cartel y despejar el complejo, planeando matar a Zak remotamente mediante su implante craneal para apoderarse del arma Cyberia y gobernar desde su estación orbital.
* **Contraparte en el SOC Hospitalario:** Detección de Compromiso de la Cuenta *Root / CISO / Director Ejecutivo* (Amenaza Interna de Nivel Directivo) y Auditoría Forense Inmutable (WORM / Blockchain Clínico).
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0540` (CVSS 10.0) — Abuso de autoridad suprema (*God-Mode / Root CISO Betrayal*): el propio emisor de las políticas de seguridad (Devlin) insertó un canal de comando oculto y un *Kill-Switch* letal en el implante del auditor (Zak) para secuestrar el activo estratégico tras la limpieza del incidente.
  2. *Detección:* El motor BLADES intercepta la telemetría cifrada saliente hacia la estación orbital de Devlin y descubre la orden firmada por la clave privada personal de Devlin preparando la ejecución remota del agente (`CMD_TERMINATE_ZAK_HOST`).
  3. *Mitigación:* Aislamiento inmediato del canal de telemetría superior hacia la FWA, preservación de la evidencia de traición ejecutiva en almacenamiento WORM (*Write-Once-Read-Many*) y preparación de contramedidas de desacoplamiento neuronal.
  4. *Prevención de Incidentes:* Criptografía de umbral (*Threshold Cryptography* / Esquema $M$-de-$N$ de Shamir) donde ningún ejecutivo, CISO o administrador único puede emitir órdenes críticas ni poseer control unilateral del sistema.

#### EP41 — La Cámara de la Entidad Cyberia (`The Living Weapon`)
* **Ubicación en Cyberia (1996):** Reactor central del complejo subterráneo donde flota la nave/organismo Cyberia.
* **Spoiler Completo de la Trama:** Zak avanza por la pasarela suspendida y contempla por primera vez a la entidad **Cyberia**: una imponente estructura biomecánica de caparazón orgánico brillante que respira y late como un ser vivo colosal suspendido sobre el abismo del reactor.
* **Contraparte en el SOC Hospitalario:** Cámara de Análisis Dinámico y Estático en *Air-Gapped Sandbox* del Artefacto Bio-Cibernético *Zero-Day*.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0541` (CVSS 9.8) — Artefacto *Zero-Day* con capacidades de resonancia electromagnética y biológica que intenta establecer un puente de comunicación directo con el hardware de inspección del analista.
  2. *Detección:* Telemetría de latido bio-digital (`#00F200` / `#30FF00`) registrada por el espectrómetro del Sandbox que muestra patrones armónicos idénticos a la frecuencia del implante BLADES.
  3. *Mitigación:* Contención en jaula de Faraday de grado hospitalario mientras se analiza la firma de acoplamiento sin ejecutar rutinas destructivas.
  4. *Prevención de Incidentes:* Entornos de detonación *Sandbox* construidos sobre hardware físico efímero sin rutas de red hacia el exterior.

#### EP42 — Convergencia Neuro-Nanotecnológica (`YOU WITH ME` - Parte 1)
* **Ubicación en Cyberia (1996):** Plataforma de enlace neural frente al núcleo de la entidad Cyberia.
* **Spoiler Completo de la Trama:** Cuando Zak se aproxima al organismo Cyberia, ocurre el fenómeno inesperado (`YOU WITH ME`): los nanobots y el implante cibernético BLADES dentro del cuerpo de Zak entran en resonancia armónica con el arma viviente. Se revela que la fisiología modificada de Zak no solo es compatible, sino que fue diseñada específicamente para ser el **sistema nervioso huésped** que el arma Cyberia esperaba para despertar.
* **Contraparte en el SOC Hospitalario:** Sincronización Criptográfica de Interfaces Cerebro-Computadora (BCI), Prótesis Neuronales y Bus de Telemetría Biométrica de Alta Frecuencia.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0542` (CVSS 9.5) — Acoplamiento inductivo y resonancia de fase entre el implante neuronal del operador y el núcleo autónomo de defensa clínica.
  2. *Detección:* Sincronización de fase perfecta (`Phase-Locked Loop = 100%`) entre el electrocardiograma/electroencefalograma (ECG/EEG) de Zak y el reloj maestro del núcleo Cyberia.
  3. *Mitigación:* Establecimiento de un apretón de manos neuronal autenticado (*Neural Handshake Protocol*) que rechaza el control externo de Devlin y vincula el núcleo exclusivamente a los signos vitales de Zak.
  4. *Prevención de Incidentes:* Autenticación biométrica continua basada en la firma única de potencial evocado cerebral (EEG P300) imposible de clonar o falsificar remotamente.

#### EP43 — Fusión Biológica Completa (`YOU WITH ME` - Parte 2)
* **Ubicación en Cyberia (1996):** Interior de la matriz orgánica de la entidad Cyberia.
* **Spoiler Completo de la Trama:** Tentáculos y filamentos biomecánicos envuelven a Zak; su cuerpo humano, su implante BLADES y la armadura/nave viviente Cyberia se funden a nivel celular y cibernético en una dramática secuencia de metamorfosis. Zak deja de ser un simple hacker humano y se convierte en la entidad **Cyberia** consciente, con poder de fuego y vuelo orbital ilimitados.
* **Contraparte en el SOC Hospitalario:** Convergencia Autónoma **SOAR + Analista Humano** (*Symbiotic Autonomous Defense Core*): Fusión del Motor de Respuesta de IA con el Operador del SOC para Neutralizar la Amenaza Ejecutiva.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0543` (CVSS 9.9) — Superación de la latencia humana de respuesta a incidentes mediante la integración directa del plano de control SOAR con la corteza visual y motora del operador.
  2. *Detección:* Confirmación de estado `SYMBIOSIS_ONLINE`: todos los subsistemas del hospital (DICOM, HL7, SCADA, EDR, Firewall) pasan a operar como extensiones reflejas del nuevo núcleo unificado.
  3. *Mitigación:* Reescritura completa del firmware del implante BLADES por parte de los nanobots de Cyberia, purgando los ganchos de espionaje de la FWA y otorgando inmunidad total al operador.
  4. *Prevención de Incidentes:* Arquitectura de ciberdefensa autónoma *Human-on-the-Loop* con capacidad de autorreparación instantánea de tejido lógico y físico.

#### EP44 — Ascenso Explosivo desde el Silo Siberiano (`Silo Breakout`)
* **Ubicación en Cyberia (1996):** Silo vertical de lanzamiento y cúpula helada del Complejo Cyberia en Siberia.
* **Spoiler Completo de la Trama:** Convertido en la nave biomecánica viviente Cyberia, Zak enciende los propulsores de plasma orgánico, atraviesa a toda potencia los anillos del silo subterráneo, hace estallar la cúpula blindada de hielo de la base siberiana y se dispara verticalmente hacia el cielo rumbo al espacio exterior para buscar a William Devlin.
* **Contraparte en el SOC Hospitalario:** Purga Total de Canales de Comando y Control (C2) Subterráneos, Rompimiento del Cerco de Aislamiento y Restablecimiento de Enlaces de Emergencia Global.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0544` (CVSS 8.9) — Bloqueo perimetral impuesto por el atacante para encerrar la telemetría dentro del complejo comprometido e impedir la notificación del incidente.
  2. *Detección:* Detección del pico de potencia de transmisión (`UPLINK_BREAKOUT_MAX`) que perfora las reglas de bloqueo del firewall perimetral siberiano.
  3. *Mitigación:* Destrucción de los nodos de contención hostiles del Cartel en el perímetro y apertura de un canal de telemetría directo de ultra-alta velocidad hacia el plano orbital.
  4. *Prevención de Incidentes:* Canales de comunicación de emergencia fuera de banda (*Break-Glass Out-of-Band Uplink*) capaces de operar incluso bajo colapso total de la infraestructura local.

---

### ACTO VI: VENGANZA ORBITAL CONTRA DEVLIN (ERRADICACIÓN DE AMENAZA PERSISTENTE)

#### EP45 — Cruce de la Ionosfera y Escudo Orbital (`Orbital Insertion`)
* **Ubicación en Cyberia (1996):** Estratosfera superior e inserción en la órbita baja terrestre (LEO).
* **Spoiler Completo de la Trama:** La entidad Zak/Cyberia abandona la atmósfera de la Tierra a velocidad hipersónica y entra en el espacio abierto, donde detecta la red de satélites artillados que protegen el sector orbital de la First World Alliance (FWA) y la fortaleza secreta de Devlin.
* **Contraparte en el SOC Hospitalario:** Aseguramiento de Constelaciones Satelitales de Emergencia Médica (GNSS / GPS de Ambulancias y Telemedicina Global) en Órbita Baja.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0645` (CVSS 9.1) — Secuestro de los transpondedores satelitales de la FWA para emitir señales de *GPS Spoofing* globales y bloquear el enrutamiento de flotas de emergencia médica.
  2. *Detección:* Telemetría orbital que identifica los satélites de defensa perimetral con tablas de enrutamiento alteradas por el comando personal de Devlin.
  3. *Mitigación:* Neutralización quirúrgica de los nodos satelitales hostiles en la capa de inserción orbital y restauración de las efemérides GNSS autenticadas (`Galileo OSNMA / GPS Chimera`).
  4. *Prevención de Incidentes:* Autenticación criptográfica de señales de navegación satelital y respaldo de posicionamiento inercial en unidades móviles de soporte vital.

#### EP46 — Enjambre de Drones de la Estación de Devlin (`Orbital Defense Grid`)
* **Ubicación en Cyberia (1996):** Espacio profundo frente a la gigantesca estación espacial de mando de William Devlin.
* **Spoiler Completo de la Trama:** Al acercarse a la estación orbital de Devlin, Zak es atacado por oleadas masivas de drones espaciales autónomos, cazas interceptores de la FWA y torretas de cañones láser montadas en el casco exterior de la estación; Zak utiliza las armas bio-plasmáticas de Cyberia para aniquilar todo el enjambre defensivo.
* **Contraparte en el SOC Hospitalario:** Desmantelamiento Activo de *Botnet IoMT Distribuida* y Enjambre de Nodos Zombi Controlados por el Actor de Amenaza Ejecutivo.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0646` (CVSS 9.5) — Movilización de una botnet masiva de miles de dispositivos periféricos comprometidos (drones/nodos zombi) lanzando ataques coordinados para proteger el servidor comando maestro de Devlin.
  2. *Detección:* Matriz de radar concéntrico (`#30FF00` / `#83FF65`) que rastrea en 360 grados los vectores de ataque del enjambre orbital y clasifica sus firmas de disparo.
  3. *Mitigación:* Despliegue automatizado de contramedidas bio-plasmáticas (reglas de sumidero BGP + neutralización activa de bots y torretas de retransmisión) despejando el corredor hacia el núcleo de mando.
  4. *Prevención de Incidentes:* Segmentación autónoma de dispositivos IoMT con revocación instantánea de identidad ante comportamiento de enjambre coordinado.

#### EP47 — Brecha en el Reactor de la Fortaleza de Devlin (`Command Core Breach`)
* **Ubicación en Cyberia (1996):** Corredor interior de la estación espacial y antesala del puente de mando de William Devlin.
* **Spoiler Completo de la Trama:** Zak/Cyberia perfora el blindaje exterior de la estación espacial y se planta frente al puente de mando. Aterrorizado, William Devlin presiona frenéticamente en su consola el botón de **apagado remoto letal (Kill-Switch)** conectado al implante craneal que le puso a Zak en el Episodio 1 para freírle el cerebro. Sin embargo, para horror de Devlin, no ocurre nada: la fusión biológica con la entidad Cyberia reescribió y anuló por completo el circuito esclavo del implante.
* **Contraparte en el SOC Hospitalario:** Anulación Definitiva de *Kill-Switch Remoto Malicioso* y Blindaje Inmutable de Firmware en Marcapasos, Neuroestimuladores y Sistemas de Soporte Vital Crítico.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0647` (CVSS 10.0) — Intento de ejecución del comando oculto de terminación letal (`0xDEAD_DEVLIN_OVERRIDE`) sobre el implante neuronal/marcapasos conectado para asesinar al paciente/operador de forma remota.
  2. *Detección:* Captura en vivo de la trama de apagado remoto firmada por Devlin impactando contra el cortafuegos biológico de la simbiosis Cyberia, generando un código de retorno `ERR_KILLSWITCH_NULLIFIED_BY_SYMBIOSIS`.
  3. *Mitigación:* Rechazo criptográfico total del pulso de terminación, inversión del túnel de telemetría para bloquear los controles de la consola de Devlin y exposición total del núcleo del puente de mando.
  4. *Prevención de Incidentes:* Prohibición por diseño físico de comandos de apagado remoto en dispositivos médicos implantables (IMDs); cualquier cambio crítico requiere acoplamiento inductivo de campo cercano (< 2 cm) verificado biológicamente.

#### EP48 — Juicio Final sobre William Devlin (`Total Threat Eradication`)
* **Ubicación en Cyberia (1996):** Puente de mando de la estación espacial de la FWA y espacio profundo exterior (Final del juego).
* **Spoiler Completo de la Trama:** Mientras William Devlin grita impotente tras el cristal del puente de mando al ver que su botón de ejecución falló, la entidad Zak/Cyberia carga su cañón bio-plasmático principal al máximo y dispara un haz devastador que atraviesa el puente, desintegrando a Devlin y haciendo estallar toda la estación espacial en mil pedazos. Libre de cadenas y dueño de su nuevo cuerpo cibernético viviente, Zak/Cyberia gira y se aleja volando hacia la inmensidad de las estrellas.
* **Contraparte en el SOC Hospitalario:** Erradicación Total del Actor de Amenaza Persistente (APT), Cierre Forense del Incidente de 48 Episodios, Emisión del Informe Post-Mortem Integral y Certificación de Resiliencia Clínica Suprema.
* **4 Pilares Clínicos:**
  1. *Análisis de Vulnerabilidad:* `CVE-2027-0648` (CVSS 10.0) — Eliminación de la raíz de confianza corrupta (*Root Authority Compromise*) que originó toda la cadena de incidentes desde el muelle de cuarentena hasta la órbita terrestre.
  2. *Detección:* Verificación de erradicación al 100%: cero latidos remanentes de los servidores C2 del Cartel ni de la estación orbital de Devlin; telemetría hospitalaria global en estado óptimo (`#83FF65`).
  3. *Mitigación:* Purga criptográfica definitiva de la infraestructura de mando de Devlin, sellado del expediente forense de los 48 episodios y transición de la consola CYBERIA-MED a vigilancia autónoma soberana.
  4. *Prevención de Incidentes:* Institucionalización del estándar **CYBERIA-MED v19.96 Resilience Framework**: arquitectura Zero Trust clínica verificada, auditoría de cadena de suministro sin puntos únicos de traición y defensa simbiótica continua.

---
## 4. SECUENCIA DE 10 PROMPTS DE INGENIERÍA PARA ANTIGRAVITY IDE (AGY)

A continuación se presentan los **10 Prompts Secuenciales de Implementación**. Cada bloque está diseñado para ser copiado y pegado directamente en **Antigravity IDE** en orden del `PROMPT 01` al `PROMPT 10`.

---

### PROMPT 01: SCAFFOLDING MODULAR EN RUBY + SINATRA & ARQUITECTURA DE DIRECTORIOS

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 01: SCAFFOLDING Y CONFIGURACIÓN BASE

Actúa como Desarrollador Senior en Ruby/Sinatra y Arquitecto de Ciberseguridad Clínica. Vamos a iniciar la construcción de la aplicación web **"CYBERIA-MED // SOC Console v19.96"** en el directorio actual del proyecto.

## TAREA 1: Crear estructura de directorios modular
Crea exactamente la siguiente jerarquía de carpetas y archivos iniciales:
- `Gemfile`
- `config.ru`
- `Rakefile`
- `app/controllers/application_controller.rb`
- `app/controllers/episodes_controller.rb`
- `app/controllers/simulators_controller.rb`
- `app/controllers/reports_controller.rb`
- `app/models/episode.rb`
- `app/models/telemetry_node.rb`
- `app/services/blades_scanner_service.rb`
- `app/services/nanomed_inoculator_service.rb`
- `app/services/forensic_report_generator.rb`
- `app/views/layout.erb`
- `app/views/index.erb`
- `app/views/episode_detail.erb`
- `app/views/simulators.erb`
- `public/css/chrysalis_medsoc.css`
- `public/js/cyberia_console.js`
- `public/js/simulators_hud.js`
- `data/episodes_part1.json`
- `data/episodes_part2.json`
- `data/episodes_part3.json`
- `spec/spec_helper.rb`
- `spec/cyberia_medsoc_spec.rb`

## TAREA 2: Implementar `Gemfile`
Escribe un `Gemfile` limpio y compatible con Ruby 3.x que incluya:
```ruby
source 'https://rubygems.org'

gem 'sinatra', '~> 4.0'
gem 'sinatra-contrib', '~> 4.0'
gem 'puma', '~> 6.4'
gem 'rackup', '~> 2.1'
gem 'json', '~> 2.7'
gem 'sqlite3', '~> 1.7'
gem 'sequel', '~> 5.78'

group :development, :test do
  gem 'rspec', '~> 3.13'
  gem 'rack-test', '~> 2.1'
end
```

## TAREA 3: Implementar `config.ru` y `app/controllers/application_controller.rb`
Configura `ApplicationController < Sinatra::Base` con soporte para `Sinatra::Namespace`, vistas en `app/views`, archivos estáticos en `public/`, cabeceras de seguridad clínica (`X-Cyberia-SOC-Version: 19.96-BLADES`, `Content-Security-Policy`) y un cargador unificado que fusione `data/episodes_part1.json`, `data/episodes_part2.json` y `data/episodes_part3.json` en memoria y/o SQLite en memoria mediante `Sequel.sqlite`.

Verifica que `bundle install` se ejecute correctamente y deja listos los controladores base para los siguientes prompts.
```

---

### PROMPT 02: SISTEMA DE DISEÑO CSS "ULTIMATE QUEEN CHRYSALIS (#523)"

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 02: DESIGN SYSTEM CSS (ULTIMATE QUEEN CHRYSALIS #523)

Actúa como Diseñador UI/UX de Terminales Biomédicas Críticas y Especialista en CSS Avanzado. Genera el archivo completo `public/css/chrysalis_medsoc.css` implementando sin omitir un solo valor la paleta hexadecimal **Ultimate Queen Chrysalis (MLP Vector Club #523)** adaptada a un monitor de soporte vital, resonancia magnética (MRI) y consola SIEM de 1996/2027.

## REQUISITOS OBLIGATORIOS DE TOKENS CSS (`:root`)
Debes declarar exactamente estas variables en `:root`:
```css
:root {
  /* 1. Fondos Clínicos Oscuros (Coat) */
  --bg-core: #0E1111;
  --bg-panel: #121312;
  --bg-surface-shadow: #252525;
  --bg-surface: #292929;
  --bg-elevated: #3D3E3D;

  /* 2. Estructura de Ventanas y Navegación (Mane, Tail, Armor & Carapace) */
  --border-structural: #164E62;
  --panel-header: #1A566D;
  --panel-header-border: #2B87AB;
  --carapace-grad-start: #218984;
  --carapace-grad-end: #6CC929;
  --carapace-deep-1: #00485C;
  --carapace-deep-2: #14747E;
  --carapace-deep-3: #409979;
  --bauble-cyan-fill: #218595;
  --bauble-cyan-bright: #29C2DA;

  /* 3. Alertas Bio-Digitales, Escáner MRI y Telemetría Activa (Magic, Horn & Iris) */
  --magic-pulse-core: #00F200;
  --magic-ring: #30FF00;
  --magic-main: #83FF65;
  --magic-highlight: #A4FF8E;
  --horn-grad-start: #5B9E00;
  --horn-grad-end: #9DE209;
  --horn-grad: linear-gradient(90deg, #5B9E00 0%, #9DE209 100%);
  --iris-warning-high: #E7F800;
  --iris-warning-mid: #AEF504;
  --iris-bg-deep-1: #00383B;
  --iris-bg-deep-2: #093534;
  --iris-bg-deep-3: #0F5150;

  /* 4. Capas Translúcidas / HUD (Wings) */
  --hud-glass-outline: #B2E5F2;
  --hud-glass-fill-light: rgba(36, 155, 167, 0.6); /* #249BA7 */
  --hud-glass-fill-dark: rgba(12, 82, 106, 0.3);  /* #0C526A */
}
```

## COMPONENTES VISUALES Y ANIMACIONES A IMPLEMENTAR EN `public/css/chrysalis_medsoc.css`
1. **Efecto de Escaneo CRT/MRI Biomédico (`.blades-crt-overlay`):** Superposición con líneas de escaneo horizontales sutiles y viñeta radial usando `--iris-bg-deep-1` (`#00383B`) y `--hud-glass-fill-dark` (`rgba(12, 82, 106, 0.3)`).
2. **Animación de Pulso Concéntrico de Magia/Radar (`@keyframes chrysalis-magic-pulse`):** Transición cíclica de anillos concéntricos desde `--magic-pulse-core` (`#00F200`) -> `--magic-ring` (`#30FF00`) -> `--magic-main` (`#83FF65`) -> `--magic-highlight` (`#A4FF8E`), aplicada a nodos críticos y al monitor ECG.
3. **Layout de Consola SOC (`.medsoc-grid`):**
   - Barra superior de telemetría con gradiente de caparazón (`linear-gradient(90deg, #00485C, #14747E, #409979)`) y borde `--panel-header-border` (`#2B87AB`).
   - Sidebar izquierdo con selector de los 6 Actos y 48 Episodios estilizado con `--bg-panel` (`#121312`) y tarjetas `--bg-surface` (`#292929`).
   - Visor Central BLADES con fondo `--iris-bg-deep-2` (`#093534`), bordes `--hud-glass-outline` (`#B2E5F2`) y paneles translúcidos `--hud-glass-fill-light`.
   - Cuadrícula de los **4 Pilares de Ciberseguridad Hospitalaria** (Vulnerabilidad, Detección, Mitigación, Prevención) con barras de progreso `--horn-grad` (`#5B9E00` a `#9DE209`) y etiquetas de severidad en `--iris-warning-high` (`#E7F800`) y `--iris-warning-mid` (`#AEF504`).
4. **Estilos de los Simuladores Interactivos:**
   - Nodos de compuertas lógicas (`AND`, `OR`, `NOT`) y válvulas hidráulicas (`V1..V4`, `MAIN_PUMP`) con estados iluminados en `#29C2DA` y `#00F200`.
   - Visor microscópico del inoculador de nanomedicina (`DRUG STORE`) con retícula circular y cepas virales animadas.
```

---

### PROMPT 03: MOTOR DE DATOS Y SEMILLA PARTE 1 (EPISODIOS 01 AL 16)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 03: MOTOR DE DATOS Y SEMILLA PARTE 1 (EP01 - EP16)

Actúa como Arquitecto de Datos Clínicos y Diseñador Narrativo de *Cyberia (1996)*. Crea el modelo `app/models/episode.rb` y genera el archivo de datos enriquecido `data/episodes_part1.json` con los **Episodios 01 al 16 completos** (Acto I: *The Rig* y primera mitad del Acto II: *Ruta Ártica*).

## ESTRUCTURA OBLIGATORIA DE CADA OBJETO JSON EN `data/episodes_part1.json`
Cada episodio del 1 al 16 debe incluir exactamente los siguientes atributos sin resumir ni truncar ninguno:
- `id`: Número entero (1 al 16)
- `code`: Código de episodio (`"EP01"` a `"EP16"`)
- `act`: `"ACTO I: PLATAFORMA OFFSHORE THE RIG"` o `"ACTO II: RUTA DE EVACUACIÓN ÁRTICA Y TÚNELES"`
- `title`: Título completo del episodio
- `game_node_code`: Código original del nodo en *Cyberia (1996)* (ej. `"FWA QUARANTINE DOCK"`, `"RIG DOCK"`, `"MEET GIA"`, `"SKEET SHOOT"`, `"BIG KISS"`, `"GOING UP"`, `"ZAPPED"`, `"EASY RIDE"`, `"BIG SHOCK"`, `"OPEN OCEAN"`, `"CATWALK"`, `"STEAL PLANE"`, `"ISLAND RUN"`, `"VALLEY RUN"`, `"ROUGH RIDE"`, `"PORT FLYBY"`)
- `game_location`: Ubicación física exacta en el juego
- `cyberia_spoiler`: Relato exhaustivo del spoiler de la trama en *Cyberia (1996)* (incluyendo muertes posibles, traiciones de Santos, decisiones con Gia, dron de Devlin, bomba de tiempo, electrocución de Santos, secuestro del TF-22 y escudo verde de Archangel)
- `hospital_counterpart`: Subsistema equivalente en el Hospital / SOC Clínico
- `clinical_protocol`: Protocolos médicos involucrados (`HL7 FHIR R4`, `DICOM`, `IEEE 11073`, `Modbus/TCP Clinical`, `BACnet`, `CAN bus`)
- `iomt_asset`: Dispositivo médico o activo industrial afectado
- `mitre_technique`: Técnica MITRE ATT&CK for ICS / Enterprise
- `pillars`: Objeto con los 4 pilares obligatorios:
  - `vulnerability`: `{ "cve": "CVE-2027-01XX", "cvss": 9.1, "vector": "CVSS:3.1/...", "description": "..." }`
  - `detection`: `{ "engine": "BLADES DPI / Sigma / YARA", "rule_name": "...", "signature": "...", "telemetry_indicator": "..." }`
  - `mitigation`: `{ "action_code": "...", "immediate_response": "...", "cli_command": "..." }`
  - `prevention`: `{ "standard": "IEC 62443 / HIPAA / NIST", "hardening_policy": "...", "zero_trust_control": "..." }`

## LISTA EXACTA DE LOS 16 EPISODIOS A POBLAR EN `data/episodes_part1.json`
1. **EP01 - Indulto Neuronal (`FWA Quarantine Dock`):** Liberación criogénica de Zak en 2027 por William Devlin, implante BLADES -> Desencriptación EHR FHIR y validación criptográfica de firmware neuronal.
2. **EP02 - Atraque en la Plataforma (`RIG DOCK`):** Llegada al muelle de *The Rig* controlado por Santos -> Auditoría de perímetro DICOM en red de telemedicina marítima.
3. **EP03 - Desarme frente a Gia (`MEET GIA`):** Gia apunta a Zak en el corredor; girar lentamente para desarmarse o morir ejecutado -> Control de acceso UEBA y prevención de intrusión física en UCI.
4. **EP04 - Defensa en la Silla de Artillería (`SKEET SHOOT`):** Ataque aéreo del Cartel; defender los 6 indicadores azules de integridad del casco desde la torreta -> Mitigación activa de DDoS volumétrico sobre los 6 clústeres de soporte vital.
5. **EP05 - El Dilema de Gia y los Celos de Santos (`BIG KISS`):** Aceptar el beso de Gia provoca que Santos ordene noquear a Zak por celos; rechazarlo mantiene la tregua temporal -> Ingeniería social, *Insider Threat* y compromiso PAM por conflicto interno.
6. **EP06 - Escáner Visor del Ascensor (`GOING UP`):** Uso del visor biométrico BLADES para activar el elevador hacia el puente superior -> Autenticación multifactor biométrica en ascensores quirúrgicos.
7. **EP07 - Traición en el Puente Grúa (`ZAPPED`):** Santos traiciona a Zak (incluso si no besó a Gia) y su guardia lo electrocuta; un dron espía de Devlin graba todo -> Detección de ataque a la cadena de suministro y telemetría de desfibrilación remota no autorizada.
8. **EP08 - Despertar en la Morgue de Carga (`EASY RIDE`):** Zak despierta atado junto a una bomba; Santos pisa por error la rejilla electrificada y muere carbonizado -> Fallo catastrófico en sistema de aislamiento eléctrico de quirófano (tablero IT).
9. **EP09 - Cortocircuito y Cartucho de Energía (`BIG SHOCK`):** Zak quema sus ataduras en la rejilla eléctrica, recupera su arma y extrae el *Power Pack* del cadáver de Santos -> Recuperación forense de tokens HSM tras incidente eléctrico.
10. **EP10 - Laberinto de Suministros y Francotirador (`OPEN OCEAN`):** Infiltración entre contenedores y neutralización del tirador apostado junto a la escalera -> Rastreo RFID de cadena de frío farmacéutica y barrido térmico de nodos *rogue*.
11. **EP11 - Emboscada en la Pasarela Superior (`CATWALK`):** Subir al hangar, bloquear electrónicamente la puerta trasera al instante para no ser acribillado por la espalda y abatir al guardia frontal -> Microsegmentación de emergencia (*Port Lockdown*) contra movimiento lateral de ransomware.
12. **EP12 - Secuestro del TF-22 Transfighter (`STEAL PLANE`):** Abordar el caza TF-22 e iniciar la secuencia de ignición bajo fuego enemigo -> Aseguramiento de ambulancia aérea autónoma MedEvac y *Secure Boot*.
13. **EP13 - Rasante sobre el Mar de Barents (`ISLAND RUN`):** Vuelo a baja cota destruyendo lanchas, helicópteros y radares costeros -> Protección de enlaces satelitales de telemedicina contra *RF Jamming*.
14. **EP14 - Cañón de Hielo y Baterías SAM (`VALLEY RUN`):** Desfiladeros helados neutralizando misiles SAM -> Filtrado de paquetes maliciosos en pasarelas de borde (*Edge Medical Gateways*).
15. **EP15 - Turbulencia en la Tormenta Polar (`ROUGH RIDE`):** Combate aéreo bajo ventisca extrema rumbo a Rusia -> Resiliencia de sensores biométricos ante ruido electromagnético extremo.
16. **EP16 - Puerto Militar de Arcángel (`PORT FLYBY`):** Destrucción del generador de escudo con brillo verde en el puerto de Archangel -> Desmantelamiento de cortafuegos inverso malicioso (*C2 Sinkhole*) en red portuaria de suministros médicos.
```

---
### PROMPT 04: SEMILLA PARTE 2 (EPISODIOS 17 AL 32)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 04: SEMILLA PARTE 2 (EP17 - EP32)

Actúa como Arquitecto de Ciberseguridad Clínica y Diseñador Narrativo de *Cyberia (1996)*. Genera el archivo `data/episodes_part2.json` con los **Episodios 17 al 32 completos**, manteniendo exactamente el mismo esquema JSON rico definido en `data/episodes_part1.json`.

## LISTA EXACTA DE LOS 16 EPISODIOS A POBLAR EN `data/episodes_part2.json`
17. **EP17 - El Túnel Subterráneo de Carga (`UNDERGROUND`):** Vuelo claustrofóbico dentro del túnel ferroviario esquivando pilares y destruyendo convoys de camiones cisterna de combustible -> Prevención de saturación del bus CAN / Backbone hospitalario de robots AGV y tubos neumáticos.
18. **EP18 - Parada de Emergencia en el Búnker (`PIT STOP`):** Aterrizaje forzoso de recarga de escudos y autodiagnóstico del TF-22 en una caverna intermedia -> Conmutación por error (*Failover*) a generadores diésel y baterías UPS de soporte vital quirúrgico.
19. **EP19 - Glaciares de Aproximación a Siberia (`ICE SCREAM`):** Tramo final de asalto aéreo sobre la tundra siberiana abriendo brecha hacia el complejo secreto -> Defensa de sistemas HVAC criogénicos y banco de sangre ante ataques DoS térmicos BACnet/IP.
20. **EP20 - Aterrizaje en la Tundra (`COLD FEET`):** Zak desciende del TF-22 frente al Complejo Cyberia y evalúa la bifurcación entre la entrada principal norte y la puerta trasera de mantenimiento -> Auditoría EASM de vectores de entrada físicos y lógicos al campus hospitalario.
21. **EP21 - Duelo en el Acceso Norte (`DOOR MAN`):** Combate táctico desde cobertura contra el centinela blindado de la puerta norte -> Neutralización de ataques de fuerza bruta y *Credential Stuffing* en el portal VPN del personal médico.
22. **EP22 - Compuerta Lógica del Perímetro (`LOCKED OUT`):** Uso del escáner de Resonancia Magnética (MRI) del implante BLADES para ver a través de la cerradura y resolver el puzzle de puertas lógicas (`AND`, `OR`, `NOT`) -> Diagnóstico formal de PLCs en esclusas de presión positiva de quirófano.
23. **EP23 - El Cuarto Oscuro y la Trampa Láser (`SLICEOMATIC`):** Si Zak manipula la cerradura secundaria sin autorización en la sala oscura, una rejilla de láseres quirúrgicos lo rebana en el acto -> Sistemas de seguridad intrínseca (*Hardwired Interlocks*) en aceleradores lineales de radioterapia y cirugía láser robótica.
24. **EP24 - Tiroteo en el Comedor de Guardia (`NOT FRIENDS`):** Emboscada de 4 guardias en el comedor; abatir a los 2 de la izquierda y cubrirse tras las cajas para eliminar a los otros 2 -> Contención en dos fases de brote de malware polimórfico en la red Wi-Fi de áreas comunes del hospital.
25. **EP25 - El Holograma del Escritorio y Espionaje (`LISTEN IN`):** Inspección del proyector holográfico 3D y ocultamiento tras una columna para escuchar en silencio a los científicos revelar detalles del arma biológica y la terminal -> Detección pasiva (*Stealth Network Tap / SPAN Port*) de tráfico DICOM/credenciales sin cifrar.
26. **EP26 - Sala de Conferencias y la Terminal de Símbolos (`GENIUS`):** Resolución contrarreloj de los 3 niveles del puzzle de símbolos geométricos (flecha azul, círculo rojo roto, cuadrado rojo, triángulo azul) en la mesa de juntas antes de que la silla ejecute a Zak -> Desactivación de bomba lógica criptográfica en el servidor central de Historias Clínicas (HIS).
27. **EP27 - Desbloqueo del Montacargas al Subsuelo (`Crate Override`):** Zak empuja la pesada caja que oculta la puerta desbloqueada y baja en el elevador de carga hacia el Nivel 2 -> Rehabilitación de rutas verticales de evacuación clínica y control de montacargas quirúrgicos.
28. **EP28 - El Guardia del Ventanal y el Gas Halón (`RED LIGHT`):** En el almacén del Nivel 2, un investigador vigila tras un cristal; si ve a Zak moverse, activa la descarga de gas Halón asfixiándolo. Zak avanza sincronizándose con el ciclo de lectura del guardia -> Seguridad en sistemas SCADA de gases medicinales y supresión de incendios por gas Halón/FM-200 en salas críticas.
29. **EP29 - Ejecución en el Laboratorio de Observación (`Glass Room Breach`):** Zak rodea el pasillo, entra a la cabina del guardia del ventanal, se oculta tras el armario y lo neutraliza antes de que active la alarma química -> Eliminación de sesión fantasma (*Session Hijacking*) en consola central de monitoreo UCI.
30. **EP30 - Terminal V-Mail y Estado de Pacientes (`Patient Status Terminal`):** Lectura de correos internos (V-Mail), fichas de pacientes infectados y apertura remota de las rejillas de ventilación -> Auditoría forense HIPAA de accesos a historias clínicas de infectología y control de presión negativa HVAC.
31. **EP31 - Infiltración por los Conductos de Aire (`Ventilation Shaft Keycard`):** Zak retira la rejilla en la antesala del ascensor, se arrastra por los ductos y toma la tarjeta magnética a través de la rejilla contigua -> Prevención de salto de redes aisladas (*Air-Gap Bypass*) y custodia de tarjetas inteligentes criptográficas del personal clínico.
32. **EP32 - El Pasillo Rojo y la Sala Plateada (`Silver Room Perimeter`):** Combate en el corredor rojo evitando quedar encerrado en la trampa sin salida de la sala plateada -> Despliegue de *Honeypots Clínicos de Alta Interacción* (cámaras y servidores PACS señuelo) para atrapar intrusos.
```

---

### PROMPT 05: SEMILLA PARTE 3 (EPISODIOS 33 AL 48)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 05: SEMILLA PARTE 3 (EP33 - EP48)

Actúa como Arquitecto de Ciberseguridad Clínica y Diseñador Narrativo de *Cyberia (1996)*. Genera el archivo `data/episodes_part3.json` con los **Episodios 33 al 48 completos** (cierre del Acto IV, Acto V: *El Núcleo Biocibernético* y Acto VI: *Venganza Orbital contra Devlin*), completando así los 48 episodios del sistema.

## LISTA EXACTA DE LOS 16 EPISODIOS A POBLAR EN `data/episodes_part3.json`
33. **EP33 - La Consola de Nanomedicina (`DRUG STORE`):** Zak se sienta en la consola médica ante el brote viral letal, elige el antídoto correcto entre 3 compuestos y dispara en tiempo real a través del visor microscópico contra los patógenos virales -> Respuesta activa EDR/XDR clínica neutralizando cepas de ransomware a nivel de kernel en bombas de infusión inteligentes.
34. **EP34 - Cruce de la Zona Contaminada e Inoculador (`UNSAFE DOOR`):** Zak entra al corredor biológico contaminado mientras su salud cae rápidamente, introduce el código del antídoto en la terminal y pisa la plataforma del Inoculador para purgar el virus de su sangre -> Ejecución de protocolo de cuarentena en Zona Roja, desinfección de endpoints y restauración desde imágenes inmutables.
35. **EP35 - Escaneo MRI de las Bombas Hidráulicas (`GRAFFITI`):** En el ascensor bloqueado con marcas de grafiti, Zak usa el escáner MRI de BLADES para ver a través del muro y alinear las 4 válvulas periféricas antes de encender la bomba maestra central -> Calibración y aseguramiento de bombas de circulación extracorpórea (ECMO) y hemodiálisis frente a sabotaje de firmware.
36. **EP36 - El Laboratorio Criogénico Subterráneo (`Cryo-Stasis Chamber`):** Descenso a las bóvedas profundas donde se conservan en frío extremo los especímenes biomecánicos del proyecto Cyberia -> Monitoreo de telemetría térmica e infrarroja en ultracongeladores de biobanco, vacunas y órganos para trasplante.
37. **EP37 - Interceptación de Telemetría de Zimmer (`Scientist Dossier`):** Acceso a los archivos del Dr. Zimmer revelando que Cyberia no es una bomba convencional, sino una entidad biomecánica viva cultivada con nanotecnología -> Detección y análisis de APT basada en código bio-sintético autónomo e IA mutante.
38. **EP38 - Neutralización de la Guardia de Élite del Núcleo (`Core Security Purge`):** Último enfrentamiento armado en los anillos internos antes de la cámara de gestación -> Revocación masiva de certificados digitales comprometidos (PKI CRL/OCSP) y purga de cuentas de dominio del Cartel.
39. **EP39 - Desactivación de Esclusas Biológicas Nivel 4 (`BSL-4 Airlock`):** Secuencia de despresurización y apertura de los cerrojos neumáticos de la cámara blindada del reactor -> Verificación criptográfica de hardware (TPM 2.0) y cascada de presión diferencial en puertas de biocontención BSL-4.
40. **EP40 - El Descubrimiento del Traidor Devlin (`FWA Telemetry Leak`):** Revelación del giro maestro: William Devlin nunca quiso destruir el arma Cyberia; usó a Zak como peón prescindible para limpiar el complejo y apoderarse del arma para sí mismo -> Detección de compromiso de la cuenta *Root / CISO / Ejecutivo* y auditoría forense inmutable en almacenamiento WORM/Blockchain.
41. **EP41 - La Cámara de la Entidad Cyberia (`The Living Weapon`):** Zak contempla por primera vez al organismo/nave biomecánica viviente suspendida en el reactor -> Análisis dinámico y estático en *Air-Gapped Sandbox* con jaula de Faraday del artefacto *Zero-Day*.
42. **EP42 - Convergencia Neuro-Nanotecnológica (`YOU WITH ME` - Parte 1):** Los nanobots del implante BLADES de Zak entran en resonancia con la entidad Cyberia, revelando que Zak fue biológicamente preparado para ser su huésped neuronal -> Sincronización segura de interfaces cerebro-computadora (BCI) y autenticación por potencial evocado cerebral (EEG).
43. **EP43 - Fusión Biológica Completa (`YOU WITH ME` - Parte 2):** La armadura orgánica y el caza viviente se funden con el sistema nervioso y circulatorio de Zak en una metamorfosis cibernética total -> Orquestación autónoma simbiótica **SOAR + Analista** donde la defensa de IA y el operador actúan como un único organismo reflejo.
44. **EP44 - Ascenso Explosivo desde el Silo Siberiano (`Silo Breakout`):** Zak, fusionado como la entidad Cyberia, destruye la cúpula del silo siberiano y se lanza hacia la estratosfera -> Purga total de canales C2 subterráneos y restablecimiento de enlaces de emergencia médica fuera de banda.
45. **EP45 - Cruce de la Ionosfera y Escudo Orbital (`Orbital Insertion`):** Salida al espacio exterior enfrentando la primera línea de satélites defensivos de la FWA -> Aseguramiento de constelaciones satelitales GNSS/GPS de ambulancias y telemedicina global.
46. **EP46 - Enjambre de Drones de la Estación de Devlin (`Orbital Defense Grid`):** Combate espacial contra oleadas de drones, cazas y torretas de la estación orbital de Devlin -> Mitigación automatizada de *Botnets IoMT Distribuidas* mediante sumideros BGP y reglas de filtrado en tiempo real.
47. **EP47 - Brecha en el Reactor de la Fortaleza de Devlin (`Command Core Breach`):** Zak perfora la estación espacial; Devlin presiona desesperadamente el botón de apagado remoto (*Kill-Switch*) del implante craneal de Zak, pero la simbiosis con Cyberia ya anuló su control -> Anulación definitiva de *Kill-Switch* remoto malicioso y blindaje inmutable del firmware de marcapasos y neuroestimuladores.
48. **EP48 - Juicio Final sobre William Devlin (`Total Threat Eradication`):** Zak dispara el cañón bio-plasmático principal contra el puente de mando, desintegrando a William Devlin y destruyendo la estación espacial antes de volar libre hacia las estrellas -> Erradicación total del actor de amenaza (APT), generación del informe Post-Mortem de los 48 episodios y certificación de resiliencia hospitalaria suprema.
```

---

### PROMPT 06: BACKEND SINATRA, SERVICIOS DE DOMINIO CLÍNICO Y API RESTFUL

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 06: BACKEND SINATRA & API RESTFUL CLÍNICA

Actúa como Desarrollador Senior en Ruby/Sinatra. Implementa la lógica completa de los modelos, servicios y controladores RESTful para la consola **"CYBERIA-MED // SOC Console v19.96"**.

## TAREA 1: Modelos (`app/models/episode.rb` y `app/models/telemetry_node.rb`)
1. En `Episode`:
   - Carga y valida los 48 episodios desde `data/episodes_part1.json`, `data/episodes_part2.json` y `data/episodes_part3.json`.
   - Métodos de consulta: `.all`, `.find_by_id(id)`, `.find_by_code(code)`, `.by_act(act_number)`, `.search(query)` (filtrando por CVE, protocolo HL7/DICOM/FHIR, código de nodo como `SLICEOMATIC` o `DRUG STORE`, activo IoMT o texto del spoiler).
   - Método `.global_metrics` que devuelve estadísticas agregadas de los 48 episodios (CVSS promedio, distribución por protocolos clínicos, conteo por acto y estado de integridad de los 6 nodos azules de soporte vital).
2. En `TelemetryNode`:
   - Modela en tiempo real los 6 nodos críticos de soporte vital hospitalario inspirados en el episodio `SKEET SHOOT` (`EP04`):
     1. `NODE-01`: Concentrador PACS/DICOM Resonancia Magnética (`#29C2DA`)
     2. `NODE-02`: Cluster Bombas de Infusión UCI (`IEEE 11073`)
     3. `NODE-03`: Servidor Maestro Historias Clínicas (`HL7 FHIR R4`)
     4. `NODE-04`: Planta SCADA de Oxígeno y Gas Halón (`Modbus/BACnet`)
     5. `NODE-05`: Laboratorio de Biocontención BSL-4 & Criogenia
     6. `NODE-06`: Enlace Satelital MedEvac TF-22 & Implante BLADES

## TAREA 2: Servicios Clínicos (`app/services/`)
1. `BladesScannerService` (`app/services/blades_scanner_service.rb`):
   - Simula los 3 modos del implante cibernético **BLADES** de Zak:
     - `infrared_scan(episode_id)`: Detecta firmas térmicas (criogenia, fiebre viral, nodos rogue ocultos en almacén).
     - `mri_logic_scan(circuit_type, inputs)`: Resuelve y valida en el backend tanto el puzzle de puertas lógicas del `EP22 (LOCKED OUT)` como el circuito de 4 válvulas hidráulicas + bomba maestra del `EP35 (GRAFFITI)`.
     - `biometric_dpi_scan(protocol_payload)`: Analiza paquetes `HL7`, `DICOM` o `IEEE 11073` y devuelve alertas YARA/Sigma.
2. `NanomedInoculatorService` (`app/services/nanomed_inoculator_service.rb`):
   - Simula la consola de nanomedicina del `EP33 (DRUG STORE)` y el inoculador del `EP34 (UNSAFE DOOR)`:
     - Recibe la cepa viral (`CYBERIA-RANSOM-ALPHA`, `HALON-WORM-BETA`, `DEVLIN-ROOTKIT-OMEGA`) y el compuesto seleccionado (`ANTIDOTE-01`, `ANTIDOTE-02`, `ANTIDOTE-03`), calcula la eficacia de neutralización en el kernel de las bombas de infusión y devuelve el token criptográfico de purga para la cámara de inoculación.

## TAREA 3: Endpoints en Controladores (`app/controllers/`)
Implementa las siguientes rutas:
- `GET /` -> Renderiza el Dashboard Principal del SOC (`index.erb`) con los 48 episodios, signos vitales ECG y topología.
- `GET /episodes/:id` -> Renderiza vista detallada o devuelve JSON si se solicita con `Accept: application/json`.
- `GET /simulators` -> Renderiza la suite interactiva de puzzles de *Cyberia* aplicados a MedSec (`simulators.erb`).
- `GET /api/episodes` -> Lista los 48 episodios con soporte para filtros `?act=`, `?protocol=`, `?q=`.
- `GET /api/episodes/:id` -> Devuelve el JSON completo del episodio incluyendo el spoiler íntegro y los 4 pilares clínicos.
- `GET /api/telemetry/vitals` -> Devuelve telemetría en vivo para el monitor ECG (`#00F200`), estado de los 6 nodos azules y nivel de resonancia neuronal Zak-Cyberia.
- `POST /api/blades/mri-scan` -> Ejecuta la validación del puzzle lógico (`LOCKED OUT`) o hidráulico (`GRAFFITI`) y devuelve el estado de los solenoides/PLC.
- `POST /api/medsec/inoculate` -> Ejecuta la síntesis del antídoto EDR (`DRUG STORE`) y la purga de endpoint (`UNSAFE DOOR`).
```

---

### PROMPT 07: FRONTEND CONSOLA PRINCIPAL ERB + JS INTERACTIVO (MONITOR ECG `#00F200` Y TOPOLOGÍA)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 07: FRONTEND CONSOLA PRINCIPAL ERB + JS INTERACTIVO

Actúa como Desarrollador Frontend Senior especializado en Interfaces de Misión Crítica y Visualización de Telemetría Médica. Construye `app/views/layout.erb`, `app/views/index.erb`, `app/views/episode_detail.erb` y `public/js/cyberia_console.js`.

## REQUISITOS DE INTERFAZ EN `app/views/layout.erb` E `index.erb`
1. **Cabecera de Telemetría BLADES v19.96:**
   - Muestra el identificador del operador (`SUBJECT: ZAK // NEURAL IMPLANT: BLADES v19.96 // YEAR: 2027`), un **Monitor de Electrocardiograma (ECG) en Canvas HTML5** trazado en vivo con `--magic-pulse-core` (`#00F200`) y estela `--magic-ring` (`#30FF00`), y los **6 Indicadores Azules de Integridad Hospitalaria** (`--bauble-cyan-fill` `#218595` y `--bauble-cyan-bright` `#29C2DA`) inspirados en la silla de artillería del `EP04`.
2. **Navegador de los 6 Actos y Línea de Tiempo de los 48 Episodios:**
   - Pestañas para filtrar por Acto (`Acto I: The Rig`, `Acto II: Ruta Ártica`, `Acto III: Nivel 1`, `Acto IV: Nivel 2`, `Acto V: Núcleo Cyberia`, `Acto VI: Órbita Devlin`) y buscador instantáneo por CVE, protocolo (`HL7`, `DICOM`, `FHIR`, `Modbus`) o código de escena (`SKEET SHOOT`, `SLICEOMATIC`, `GENIUS`, `RED LIGHT`, `DRUG STORE`, `YOU WITH ME`).
3. **Visor Central de Episodio y Lore Dual (Cyberia 1996 <-> Hospital SOC):**
   - Al hacer clic en cualquiera de los 48 episodios, el panel central se actualiza dinámicamente vía Fetch API sin recargar la página, mostrando:
     - Código de Nodo Original (`game_node_code`), Acto, Ubicación en *Cyberia (1996)* y Contraparte en el Hospital.
     - **Panel de Spoiler Narrativo Completo (`CYBERIA 1996 CHRONICLE`):** Relato íntegro de lo que ocurre en esa escena del juego.
     - **Matriz de los 4 Pilares Clínicos:**
       1. *Pilar 1 — Análisis de Vulnerabilidad:* Badge con `CVE-2027-XXXX`, score `CVSS`, vector, protocolo clínico y activo IoMT comprometido.
       2. *Pilar 2 — Detección (BLADES DPI / SIEM):* Regla YARA/Sigma formateada en bloque de código terminal (`#83FF65` sobre `#00383B`) e indicador de telemetría.
       3. *Pilar 3 — Mitigación Activa:* Respuesta inmediata, barra de progreso `--horn-grad` (`#5B9E00` -> `#9DE209`) y botón interactivo **"EJECUTAR PLAYBOOK DE MITIGACIÓN"** que simula la ejecución del comando CLI en la consola inferior.
       4. *Pilar 4 — Prevención de Incidentes:* Estándar normativo (`IEC 62443`, `HIPAA`, `FDA Premarket`), política de Hardening y control Zero Trust.
4. **Mapa de Topología Hospitalaria / Complejo Cyberia:**
   - Diagrama interactivo SVG en el panel derecho que mapea los pisos del hospital con las zonas del juego (*The Rig*, *Túnel Ártico*, *Nivel 1 Admisiones/Láser*, *Nivel 2 Halón/Nanomedicina*, *Núcleo BSL-4*, *Estación Orbital FWA*) iluminando el nodo activo con anillos concéntricos `#30FF00`.
```

---
### PROMPT 08: SIMULADORES INTERACTIVOS MEDSEC (PUZZLES DE CYBERIA APLICADOS A INGENIERÍA BIOMÉDICA)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 08: SIMULADORES INTERACTIVOS DE PUZZLES (MRI GATE SOLVER, HYDRAULIC ECMO & NANOMED EDR)

Actúa como Ingeniero de Sistemas de Control Biomédico y Desarrollador de Simuladores Interactivos en JS/Sinatra. Implementa la vista `app/views/simulators.erb` y el motor frontend `public/js/simulators_hud.js` conectado a los endpoints `POST /api/blades/mri-scan` y `POST /api/medsec/inoculate`.

## SIMULADOR 1: BLADES MRI LOGIC GATE SOLVER (Basado en EP22 `LOCKED OUT` y EP26 `GENIUS`)
* **Contexto Narrativo y Clínico:** Reproduce el escáner de Resonancia Magnética (MRI) del implante BLADES viendo a través de la placa metálica de la esclusa de quirófano y el controlador PLC de oxígeno.
* **Mecánica Interactiva:**
  - Presenta en pantalla un circuito interactivo SVG/Canvas con fondo `--iris-bg-deep-1` (`#00383B`), trazos de cobre iluminados y tres interruptores de entrada booleana (`INPUT_A`, `INPUT_B`, `INPUT_C`) conectados a compuertas lógicas (`AND`, `OR`, `NOT`, `XOR`) que alimentan el solenoide final (`SURGICAL_AIRLOCK_SOLENOID`).
  - Incluye además el modo `GENIUS SYMBOL MATRIX` (`EP26`) con los 4 símbolos geométricos clásicos (*Flecha Azul*, *Círculo Rojo Roto*, *Cuadrado Rojo*, *Triángulo Azul*) y un temporizador de bomba lógica en el servidor HIS.
  - Cuando el usuario conmuta las entradas y logra que todas las líneas brillen en `#00F200` (`--magic-pulse-core`), envía el estado a `POST /api/blades/mri-scan`, desbloquea la esclusa y emite el certificado de verificación formal del PLC.

## SIMULADOR 2: BLADES MRI HYDRAULIC & ECMO VALVE ALIGNER (Basado en EP35 `GRAFFITI`)
* **Contexto Narrativo y Clínico:** Reproduce el puzzle del ascensor con grafitis del `EP35`, donde Zak usa el visor MRI para alinear las **4 válvulas periféricas** antes de activar la **bomba hidráulica maestra**, traducido a la calibración de una máquina de Circulación Extracorpórea (ECMO) y Hemodiálisis bajo ataque de firmware.
* **Mecánica Interactiva:**
  - Muestra la capa externa con marcas de grafiti industrial que se vuelve translúcida (`--hud-glass-fill-light` `rgba(36, 155, 167, 0.6)`) al activar el botón **"ACTIVATE BLADES MRI OVERLAY"**.
  - El usuario debe abrir secuencialmente las 4 válvulas periféricas (`VALVE_01_VENOUS`, `VALVE_02_OXYGENATOR`, `VALVE_03_HEAT_EXCHANGER`, `VALVE_04_ARTERIAL_FILTER`) antes de pulsar `MAIN_ROTOR_PUMP`. Si pulsa la bomba central con alguna válvula cerrada, se dispara una alerta de sobrepresión en `#E7F800` (`--iris-warning-high`) explicando el fallo hemodinámico/hidráulico.

## SIMULADOR 3: NANOMEDICINE EDR INOCULATOR & HALON TIMING (Basado en EP33 `DRUG STORE`, EP34 `UNSAFE DOOR` y EP28 `RED LIGHT`)
* **Contexto Narrativo y Clínico:** Reproduce la estación médica `DRUG STORE` del Nivel 2 donde Zak selecciona uno de los 3 antídotos y dispara en tiempo real a los patógenos virales en un visor microscópico, para luego introducir el código en la cámara de inoculación (`UNSAFE DOOR`).
* **Mecánica Interactiva:**
  - **Paso 1:** Selección entre 3 compuestos heurísticos (`COMPOUND-ALPHA [Kernel Mutex Vaccine]`, `COMPOUND-BETA [DICOM Buffer Shield]`, `COMPOUND-GAMMA [Neuro-Nanobot Purge]`).
  - **Paso 2 (Visor Microscópico Canvas):** Cepas virales bio-digitales se dividen en tiempo real dentro del torrente sanguíneo/memoria RAM de las bombas de infusión; el analista apunta con la retícula `--hud-glass-outline` (`#B2E5F2`) y dispara pulsos `#30FF00` para neutralizar los patógenos antes de que la integridad caiga a 0%.
  - **Paso 3 (Cámara de Inoculación):** Al erradicar los patógenos, el backend `POST /api/medsec/inoculate` entrega un código de purga de 6 dígitos que el usuario introduce en el panel `UNSAFE DOOR` para restaurar la salud del sistema al 100% con una barra de progreso `--horn-grad` (`#5B9E00` -> `#9DE209`).
```

---

### PROMPT 09: GENERADOR DE INFORMES FORENSES POST-MORTEM Y CUMPLIMIENTO (MARKDOWN / JSON)

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 09: GENERADOR DE INFORMES FORENSES Y CUMPLIMIENTO CLÍNICO

Actúa como Auditor Principal de Respuesta a Incidentes Biomédicos (DFIR) y Especialista en Cumplimiento Normativo (HIPAA, IEC 62443, NIST SP 800-66, FDA Cybersecurity). Implementa `app/services/forensic_report_generator.rb` y `app/controllers/reports_controller.rb`.

## FUNCIONALIDADES REQUERIDAS
1. **Servicio `ForensicReportGenerator` (`app/services/forensic_report_generator.rb`):**
   - `generate_episode_bulletin(episode_id)`: Genera un boletín técnico completo en formato Markdown (`.md`) o JSON para un episodio individual, incluyendo:
     - Metadatos del Incidente (`CYBERIA-MED-CERT-2027-EPXX`), fecha estelar/clínica, nodo original del juego y subsistema hospitalario afectado.
     - Crónica Forense del Evento (Spoiler completo de *Cyberia 1996* correlacionado con la línea de tiempo del ataque al hospital).
     - Desglose técnico de los 4 Pilares (CVE/CVSS, Regla YARA/Sigma de Detección, Comandos de Mitigación y Controles de Prevención Zero Trust).
   - `generate_act_dossier(act_number)`: Genera el reporte consolidado de cualquiera de los 6 Actos completos.
   - `generate_full_postmortem_48()`: Genera el **Expediente Maestro Post-Mortem de los 48 Episodios** (desde el indulto neuronal de Zak en `EP01` hasta la desintegración orbital del traidor William Devlin en `EP48`), certificando la resiliencia del hospital.

2. **Endpoints en `ReportsController` (`app/controllers/reports_controller.rb`):**
   - `GET /reports/episode/:id.md` -> Descarga directa (`Content-Disposition: attachment`) del boletín en Markdown del episodio solicitado.
   - `GET /reports/episode/:id.json` -> Exportación estructurada en JSON compatible con STIX/TAXII clínico.
   - `GET /reports/act/:act_num.md` -> Descarga del dossier por Acto.
   - `GET /reports/postmortem-full-48.md` -> Descarga del informe forense integral de los 48 episodios.

3. **Integración en la UI:**
   - Añade botones de exportación instantánea (**"DESCARGAR BOLETÍN FORENSE (.MD)"**, **"EXPORTAR IOC STIX (.JSON)"** y **"GENERAR POST-MORTEM GLOBAL 48 EPISODIOS"**) en la consola principal y en el visor de cada episodio.
```

---

### PROMPT 10: SUITE DE PRUEBAS AUTOMATIZADAS RSPEC Y SCRIPT DE VERIFICACIÓN INTEGRAL

```markdown
# EJECUTAR EN ANTIGRAVITY IDE — PROMPT 10: SUITE DE PRUEBAS RSPEC Y VERIFICACIÓN INTEGRAL

Actúa como Ingeniero QA Principal de Software Médico Crítico (IEC 62304). Implementa `spec/spec_helper.rb`, `spec/cyberia_medsoc_spec.rb` y el `Rakefile` para verificar de punta a punta la aplicación **"CYBERIA-MED // SOC Console v19.96"**.

## PRUEBAS OBLIGATORIAS EN `spec/cyberia_medsoc_spec.rb`
1. **Verificación de Integridad de los 48 Episodios:**
   - Comprueba que `Episode.all.count` sea exactamente `48`.
   - Itera del `1` al `48` verificando que ningún episodio falte, que todos tengan su código (`EP01`..`EP48`), su `game_node_code` (verificando explícitamente hitos como `"RIG DOCK"`, `"MEET GIA"`, `"SKEET SHOOT"`, `"BIG KISS"`, `"ZAPPED"`, `"EASY RIDE"`, `"BIG SHOCK"`, `"CATWALK"`, `"STEAL PLANE"`, `"PORT FLYBY"`, `"UNDERGROUND"`, `"LOCKED OUT"`, `"SLICEOMATIC"`, `"LISTEN IN"`, `"GENIUS"`, `"RED LIGHT"`, `"DRUG STORE"`, `"UNSAFE DOOR"`, `"GRAFFITI"`, `"YOU WITH ME"`), su `cyberia_spoiler` no vacío (> 100 caracteres) y su `hospital_counterpart`.
2. **Verificación de los 4 Pilares de Ciberseguridad Hospitalaria en cada Episodio:**
   - Comprueba que los 48 episodios contengan las claves `vulnerability` (con `cve` y `cvss`), `detection` (con `rule_name` y `signature`), `mitigation` (con `immediate_response` y `cli_command`) y `prevention` (con `standard` y `zero_trust_control`).
3. **Verificación Estricta de la Paleta Hexadecimal "Ultimate Queen Chrysalis (#523)":**
   - Realiza un `GET /css/chrysalis_medsoc.css` y verifica mediante expresiones regulares que estén presentes todos los códigos hexadecimales obligatorios:
     - Fondos Coat: `#0E1111`, `#121312`, `#252525`, `#292929`, `#3D3E3D`
     - Estructura/Caparazón: `#164E62`, `#1A566D`, `#2B87AB`, `#218984`, `#6CC929`, `#00485C`, `#14747E`, `#409979`, `#218595`, `#29C2DA`
     - Magia/Cuerno/Iris: `#00F200`, `#30FF00`, `#83FF65`, `#A4FF8E`, `#5B9E00`, `#9DE209`, `#E7F800`, `#AEF504`, `#00383B`, `#093534`, `#0F5150`
     - Alas/HUD: `#B2E5F2`, `rgba(36, 155, 167, 0.6)`, `rgba(12, 82, 106, 0.3)`
4. **Pruebas de Endpoints API y Simuladores:**
   - Verifica `GET /`, `GET /simulators`, `GET /api/episodes`, `GET /api/episodes/22`, `GET /api/episodes/33`, `GET /api/episodes/48`.
   - Verifica `POST /api/blades/mri-scan` para el puzzle lógico `LOCKED OUT` (`EP22`) y para las 4 válvulas hidráulicas `GRAFFITI` (`EP35`).
   - Verifica `POST /api/medsec/inoculate` para la consola de nanomedicina `DRUG STORE` (`EP33`) y purga `UNSAFE DOOR` (`EP34`).
   - Verifica `GET /reports/postmortem-full-48.md` comprobando que el documento descargado incluya los 48 episodios y mencione el destino final de William Devlin y la simbiosis de Zak con Cyberia.

## EJECUCIÓN FINAL
Ejecuta `bundle exec rspec --format documentation` y asegúrate de que el 100% de los ejemplos pasen en verde (`#00F200`). Documenta en consola el comando de arranque `bundle exec rackup -p 4567` para iniciar la terminal clínica interactiva.
```

---

## 5. GUÍA RÁPIDA DE EJECUCIÓN EN ANTIGRAVITY IDE

Para construir el proyecto completo usando este Blueprint:
1. Copia y ejecuta el **PROMPT 01** para levantar el esqueleto en Ruby + Sinatra e instalar las gemas.
2. Copia y ejecuta el **PROMPT 02** para instalar el sistema de diseño visual con la paleta hexadecimal íntegra de **Ultimate Queen Chrysalis (#523)**.
3. Copia y ejecuta en orden los **PROMPTS 03, 04 y 05** para poblar la base de conocimiento con los **48 episodios completos**, sus spoilers exactos de *Cyberia (1996)* y sus 4 pilares de ciberseguridad hospitalaria.
4. Copia y ejecuta los **PROMPTS 06, 07, 08 y 09** para activar el backend Sinatra, la consola clínica con monitor ECG en tiempo real, los simuladores interactivos de puzzles (`LOCKED OUT`, `GENIUS`, `GRAFFITI`, `DRUG STORE`, `UNSAFE DOOR`) y el motor de reportes forenses.
5. Copia y ejecuta el **PROMPT 10** para validar automáticamente mediante RSpec toda la arquitectura, el lore de los 48 episodios y la fidelidad cromática del sistema.
