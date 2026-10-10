# Proprietary RIL / Modem Blobs and Shims for Samsung Galaxy S5 3G (k3gxx)

Este repositório contém os drivers do modem Intel XMM6360 (baseband) e shims do Samsung Galaxy S5 3G (`k3gxx`).

## Componentes

### 1. Binários Proprietários (`proprietary/`)
* `libsec-ril.so`: Biblioteca proprietária do Radio Interface Layer (RIL) para comunicação entre o sistema Android e o modem.
* `cbd`: Daemon CP Boot Daemon responsável pelo handshake e upload de firmware/imagens para o modem Intel no boot.

### 2. Shims de Compatibilidade (`shims/`)
* `libshim_secnative.cpp` (`libshim_secnative.so`):
  * Mapeado para `libsec-ril.so` através de `TARGET_LD_SHIM_LIBS`.
  * Substitui a função atômica legada `android_atomic_release_cas()` removida do Bionic no Android 7+ usando instruções nativas `__atomic_compare_exchange_n()`.
