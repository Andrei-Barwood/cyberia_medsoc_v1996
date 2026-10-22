# CYBERIA-MED // SOC Console v19.96

Consola de operaciones de seguridad clínica inspirada en la aventura de ciencia ficción *Cyberia* (1996). El proyecto combina una aplicación web en Ruby/Sinatra, una interfaz de terminal biomédica retrofuturista y escenarios ficticios de ciberseguridad hospitalaria.

## Requisitos

- macOS con Apple Silicon.
- Zsh, Ruby 3.2 o posterior y Bundler 4.0.23.
- Homebrew solo es necesario si el instalador debe añadir Ruby.
- El ejecutable `Aegis9CyberbrainEDR` se incluye en `bin/`.

## Instalación

Desde Terminal, entra en la carpeta del proyecto y ejecuta:

```zsh
cd /ruta/a/cyberia_medsoc_v1996
./instalador.zsh
```

El instalador comprueba Ruby y Bundler, instala las gemas declaradas en `Gemfile.lock` con `bundle install` y verifica que el binario Aegis9 esté disponible. En este Mac, el Ruby de Homebrew se añade al `PATH` de esa ejecución; si instalas Ruby por primera vez, abre una Terminal nueva antes de iniciar el servidor.

## Iniciar el servidor

```zsh
./servidor.zsh
```

El script inicia la aplicación en `http://127.0.0.1:4567/`, espera hasta que responda y abre la consola en el navegador predeterminado. Déjalo ejecutándose mientras uses la aplicación; pulsa `Ctrl+C` para apagarlo. Si el puerto 4567 ya está ocupado, puedes elegir otro:

```zsh
PORT=4570 ./servidor.zsh
```

La interfaz quedará disponible en `http://127.0.0.1:4570/`. El servidor escucha en `127.0.0.1`, por lo que esta configuración está pensada para uso local.

## Pruebas

```zsh
bundle exec rspec
```

## Sinopsis

CYBERIA-MED reimagina los 48 episodios de *Cyberia* como un recorrido por un centro de operaciones de seguridad médica: lo que en la aventura es una infiltración y una carrera hacia un núcleo biocibernético, aquí se traduce en la observación, diagnóstico y respuesta ante incidentes en una infraestructura hospitalaria conectada. BLADES funciona como el sentido aumentado del recorrido; los dispositivos IoMT y sus señales son el territorio que hay que comprender, no solo controlar.

La progresión puede leerse como una geometría espiritual:

- **El círculo** representa la atención continua: observar la telemetría, volver al contexto y mantener unidos los nodos de una red clínica. Ninguna señal aislada explica el sistema entero.
- **El triángulo** expresa el ciclo de cuidado y respuesta —vulnerabilidad, detección y mitigación, sostenidas por la prevención—. Cada lado necesita a los demás para que la respuesta no quede incompleta.
- **El eje hacia el núcleo** evoca el viaje desde el perímetro hasta el centro: de la superficie visible de la red a las dependencias profundas, los riesgos y las decisiones que sostienen el conjunto.

Desde el minimalismo espiritual, la consola no propone vaciar de significado la tecnología, sino despejar el ruido para atender lo esencial: la integridad del sistema y el cuidado de quienes dependen de él. Su minimalismo digital es una disciplina de enfoque; cada panel, color de alerta y pulso visual busca dar forma legible a una señal. Como en una práctica contemplativa, la interfaz invita a observar antes de actuar y a responder con precisión en vez de añadir movimiento innecesario.

Esta lectura es una metáfora de diseño y narrativa. Los escenarios y protocolos representados pertenecen a una simulación; la aplicación no debe considerarse una herramienta clínica ni un sistema de protección certificado.

## Tecnologías

Ruby, Sinatra, Puma, SQLite3/JSON, RSpec y JavaScript/CSS sin framework. La arquitectura, los escenarios y el diseño visual se describen con más detalle en [`CYBERIA_MEDSEC_BLUEPRINT.md`](CYBERIA_MEDSEC_BLUEPRINT.md).
