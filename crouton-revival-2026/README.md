# 💀 CROUTON-REVIVAL-2026: The Necromancer's Guide to ChromeOS

> **Status:** Legacy Support / Reverse Engineering
> **Condition:** Brutal. ChromeOS is a fortress; we are the termites.

Este não é um guia para iniciantes. Se você está aqui em 2026 tentando rodar o Crouton, você já aceitou que seu hardware é um "zumbi" digital. O projeto original morreu em 2025 (GitHub Read-Only), o Google trancou as portas com o `noexec` global e o binário `jq` nativo do ChromeOS pertence a um museu.

---

## 1. O CENÁRIO (THE SITUATION)

O ecossistema Crouton em 2026 é um campo de batalha:
- **Crouton EOL:** O script oficial não recebe patches. Dependências quebraram, mirrors sumiram.
- **Hardening do ChromeOS:** A partição `/home/chronos/user/Downloads` agora é montada com a flag `noexec`. Você não pode mais baixar o script e executá-lo diretamente. O sistema "protege" você de si mesmo.
- **The `jq` Tragedy:** O `jq` nativo do ChromeOS (se disponível) é tão antigo que falha ao processar as releases do Debian/Ubuntu com o erro `strftime not defined`. Sem um `jq` funcional, o script de instalação não consegue parsear as versões das distros.

---

## 2. O PROTOCOLO DE QUEBRA (THE FIX)

⚠️ **AVISO:** Você precisa estar em **Developer Mode**. Se você não sabe o que é isso, feche este arquivo e vá usar o Linux Development Environment (Crostini) até ele saturar sua RAM.

### A) Injeção de Dependência (`jq` Fix)
O ChromeOS bloqueia quase tudo, exceto o `/usr/local/bin/`. Vamos injetar um binário moderno aqui para sobrescrever a mediocridade do sistema.

```bash
# Eleva privilégios e baixa o jq 1.7.1 (Linux 64-bit)
sudo curl -L -o /usr/local/bin/jq https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux64

# Garante que o sistema consiga executá-lo
sudo chmod +x /usr/local/bin/jq
```

### B) Evasão de `noexec`
Tentar rodar o instalador na pasta Downloads resultará em `Permission Denied`, mesmo com `sudo`. Vamos mover o artefato para a zona de execução persistente.

```bash
# Move o instalador para o refúgio seguro
sudo install -Dt /usr/local/bin -m 755 ~/Downloads/crouton
```

---

## 3. A INSTALAÇÃO CIRÚRGICA (THE INSTALL)

Não tente instalar Ubuntu Xenial. O espelho está morto (404) ou irremediavelmente quebrado. Em 2026, nossa única esperança de estabilidade em hardware legado é o **Debian Bullseye**.

- **Distro:** `bullseye` (Estável o suficiente para não quebrar, antiga o suficiente para o seu kernel jurássico).
- **Interface:** `xfce` (Único DE que não chora tentando renderizar via software quando a aceleração de GPU falha).

**O Comando de Ressurreição:**
```bash
sudo crouton -r bullseye -t xfce
```

---

## 4. OPERAÇÃO (RUNTIME)

Uma vez que o chroot esteja montado e a alma do Debian injetada no seu Chromebook:

- **Boot:** `sudo startxfce4`
- **Alternância de Planos (Sistemas):** 
    - `Ctrl+Alt+Shift+F1` (Voltar para o ChromeOS)
    - `Ctrl+Alt+Shift+F2` (Entrar no Abismo/Linux)
- **Aviso de Sobrevivência:** ⚠️ **NUNCA FECHE A TAMPA DO LAPTOP.** O gerenciamento de energia do ChromeOS em 2026 é agressivo. Se o sistema entrar em sleep enquanto o chroot está ativo, há 85% de chance de corrupção do sistema de arquivos.

---
*"In the land of the locked bootloader, the man with a writable /usr/local/bin is king."* 
-- Lucasdoreac, 2026
