<p align="center">
  <a href="https://github.com/Dathinel/rodaje"><img src="https://raw.githubusercontent.com/Dathinel/rodaje/main/assets/marca/rodaje.svg" alt="Logotipo de Rodaje" width="104"></a>
</p>

<h1 align="center">rodaje-preajustes-pro</h1>

<p align="center">
  Complemento opcional para <a href="https://github.com/Dathinel/rodaje">Rodaje</a>: 15 preajustes de exportación profesionales, listos en el diálogo de exportar.
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/licencia-CC0_1.0-E8833A?style=flat-square&labelColor=1D1D1D" alt="Licencia CC0 1.0"></a>
  <a href="https://github.com/Dathinel/rodaje-preajustes-pro/releases/latest"><img src="https://img.shields.io/github/v/release/Dathinel/rodaje-preajustes-pro?style=flat-square&labelColor=1D1D1D&color=E8833A&label=versi%C3%B3n" alt="Última versión"></a>
  <img src="https://img.shields.io/badge/formato-.paquete-E8833A?style=flat-square&labelColor=1D1D1D" alt="Formato .paquete">
  <a href="https://github.com/Dathinel/rodaje"><img src="https://img.shields.io/badge/para-Rodaje-E8833A?style=flat-square&labelColor=1D1D1D" alt="Para Rodaje"></a>
</p>

Son solo datos (`rodaje.exportpreset` v1): contenedor, códec, perfil, tamaño, tasa, campos y sonoridad. Rodaje los traduce a sus ajustes y comprueba que este equipo los pueda codificar antes de empezar.

| Grupo | Preajustes |
|---|---|
| Maestros | ProRes 422 HQ, ProRes 4444, ProRes 4444 con alfa, DNxHR HQX (MOV y MXF OP1a), DNxHR 444; todos con PCM de 24 bits |
| Emisión | HD 1080i25 con EBU R128 (−23 LUFS, −1 dBTP), HD 1080i29,97 con ATSC A/85 (−24 LKFS, −2 dBTP), HD 1080p25 con EBU R128. Entrelazados con el campo superior primero, en ProRes 422 HQ |
| Cine | 2K (2048×1080) y 4K (4096×2160) a 24 fps, el maestro del que se arma un DCP |
| Archivo | FFV1 v3 de 10 bits con CRC por porción y FLAC de 24 bits en Matroska |
| Web | VP9 1080p y 4K en WebM, AV1 1080p en MP4; los tres con dos pasadas, Opus y −14 LUFS |

El entrelazado lo hace Rodaje: compone a la tasa de campos (50 o 59,94 por segundo) y teje cada par en un cuadro, así el movimiento conserva la cadencia de la emisión.

## Instalar en Rodaje

En Rodaje, Complementos → Instalar lo baja, comprueba su firma y lo instala. A mano: descarga `rodaje-preajustes-pro-<versión>.paquete` de las [releases](https://github.com/Dathinel/rodaje-preajustes-pro/releases) y usa «Instalar desde archivo…» en Complementos. Los preajustes aparecen en Exportar, entre los de fábrica y los propios.

## Construir el paquete

```
powershell -NoProfile -ExecutionPolicy Bypass -File probar.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File empaquetar.ps1
```

Solo hace falta Windows PowerShell 5.1. `probar.ps1` comprueba que cada preajuste del manifiesto exista, sea `rodaje.exportpreset` v1 con su id y nombre, y que no sobre ninguno. `empaquetar.ps1` deja `dist\rodaje-preajustes-pro-<versión>.paquete` con orden y fecha fijos.

## Licencia

CC0 1.0 (dominio público), ver `LICENSE`. ProRes, DNxHR y los nombres de las normas son marcas o publicaciones de sus dueños y solo se nombran para decir con qué es compatible cada preajuste. El logotipo de Rodaje es marca de su autor y no forma parte de este contenido ([TRADEMARK.md](https://github.com/Dathinel/rodaje/blob/main/TRADEMARK.md)).
