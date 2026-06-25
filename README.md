# PasantIA 🎓

**Plataforma blockchain para gestión de pasantías universitarias**

> Proyecto final — Teoría de la Computación 2 · Universidad Champagnat (UCH)

---

## Demo en vivo

🔗 **[https://pasant-ia.vercel.app](https://pasant-ia.vercel.app)**

---

## ¿Qué es PasantIA?

PasantIA es una plataforma que conecta alumnos universitarios con empresas para la gestión de pasantías, utilizando inteligencia artificial para el matching y blockchain para la certificación de experiencia laboral.

Cuando una pasantía finaliza, la facultad emite un certificado **SBT (Soul Bound Token)** en **Hedera Testnet** a través de un smart contract real. El certificado queda registrado permanentemente en la blockchain y puede verificarse con un código QR que apunta a la transacción en HashScan.

---

## Funcionalidades principales

- **Matching mutuo con IA** — Los alumnos exploran pasantías con swipe y las empresas ven candidatos. El match solo ocurre cuando ambas partes se eligen mutuamente.
- **Tracker de proceso** — Seguimiento de etapas (Match → Entrevista → Contrato → En curso) con opción de finalizar en cualquier momento.
- **Certificados blockchain** — Emisión de SBT en Hedera Testnet mediante smart contract Solidity desplegado por el equipo.
- **Verificación por QR** — Cada certificado tiene un QR que apunta a la transacción real en HashScan.
- **Tres roles** — Alumno, Empresa y Facultad, cada uno con su propio dashboard.

---

## Tecnologías

| Capa | Tecnología |
|------|-----------|
| Frontend | HTML5 · CSS3 · JavaScript (vanilla) |
| Base de datos | Supabase (PostgreSQL) |
| Blockchain | Hedera Testnet · Solidity · ethers.js v5 |
| Smart contract | `PasantiaCertificado.sol` — Contract ID: `0.0.9277865` |
| RPC | HashIO JSON-RPC Relay |
| Deploy | Vercel |

---

## Cómo usar el demo

### Alumno
| Campo | Valor |
|-------|-------|
| Email | `lucia@uch.edu.ar` |
| Contraseña | `demo2026` |

### Empresas
| Empresa | Email | Contraseña |
|---------|-------|-----------|
| Mercado Libre | `rrhh@mercadolibre.com` | `demo2026` |
| Globant | `rrhh@globant.com` | `demo2026` |
| Banco Nación | `rrhh@banconacion.com` | `demo2026` |
| Ualá | `rrhh@uala.com` | `demo2026` |
| Accenture | `rrhh@accenture.com` | `demo2026` |

### Facultad
| Campo | Valor |
|-------|-------|
| Email | cualquier email `@uch.edu.ar` |
| Código de acceso | `faculty2026` |

---

## Video demo

▶ [Ver video demo en Google Drive](https://drive.google.com/file/d/1IwjTz7GRHPaj9ojUBl67SG67bBeP9V4R/view?usp=sharing)

---

## Estructura del repositorio

```
PasantIA/
├── index.html                          # Aplicación completa (SPA)
├── mockup_pasantias.html               # Mockup inicial de diseño
├── contracts/
│   └── PasantiaCertificado.sol         # Smart contract Solidity
├── docs/
│   ├── lean-canvas.pdf                 # Canvas de Propuesta de Valor
│   ├── memoria-tecnica.pdf             # Memoria técnica
│   └── pitch-deck.pdf                  # Pitch Deck
└── README.md
```

---

## Smart contract en Hedera

El contrato `PasantiaCertificado.sol` fue desplegado en Hedera Testnet por el equipo.

- **Contract ID:** `0.0.9277865`
- **Ver en HashScan:** [hashscan.io/testnet/contract/0.0.9277865](https://hashscan.io/testnet/contract/0.0.9277865)

El contrato registra cada pasantía con tres confirmaciones (alumno, empresa y facultad) antes de emitir el certificado final.

---

## Equipo

Proyecto desarrollado para la materia **Teoría de la Computación 2** — UCH 2026.

| Integrante | Rol |
|------------|-----|
| Emilia Pisinatti | Frontend |
| Sofía Aguero | Blockchain |
| Tiziana Valdez | Inteligencia Artificial |
| Mia Nogara | Documentación & Pitch |
