#!/bin/bash

# Script de configuração para Chromebook "kip" (HP 11 G4)
# Este script deve ser executado DENTRO do ambiente Linux (Crouton/XFCE)

echo "--- Iniciando configuração Batatinha Gourmet para Chromebook ---"

# 1. Atualizar o sistema
echo "[1/4] Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

# 2. Instalar dependências para o Hydra e apps modernos
echo "[2/4] Instalando dependências (libfuse, nss, wine)..."
sudo apt install -y libfuse2 libnss3 wget wine64 wine32 git python3-pip

# 3. Baixar o Hydra Launcher (Placeholder - sempre verifique a última versão)
echo "[3/4] Baixando Hydra Launcher..."
wget -O ~/hydra.AppImage https://github.com/hydralauncher/hydra/releases/latest/download/hydra-launcher-linux-x86_64.AppImage
chmod +x ~/hydra.AppImage

# 4. Otimização de Memória (Swap file)
# Como o 'kip' tem pouca RAM, criamos um arquivo de swap de 2GB
echo "[4/4] Criando arquivo de swap para melhor desempenho..."
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "--- Configuração Concluída! ---"
echo "Para abrir o Hydra: ./hydra.AppImage"
