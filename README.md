Perfeito! Vou atualizar o seu README, acrescentando as libs e tecnologias que você usou no projeto (incluindo a parte de mapa, Dio, Geoapify, etc) e mantendo o estilo do texto que você já usou. Segue a versão revisada e ampliada:

---

# 📱 HealthCheck App

## 📖 Visão Geral

**HealthCheck App** é a aplicação frontend do sistema de vigilância epidemiológica **HealthCheck**. Desenvolvido em **Flutter**, o aplicativo foi projetado para ser utilizado por **agentes de saúde em campo**, permitindo o **registro, acompanhamento e visualização georreferenciada de casos de doenças** em tempo real. A interface é intuitiva e otimizada para dispositivos móveis, com foco na usabilidade e experiência do usuário.

---

## 🩺 Principais Funcionalidades

* **Autenticação de Agentes:** Login seguro com persistência de sessão
* **Cadastro de Casos:** Registro de ocorrências com endereço, tipo de doença e sintomas
* **Georreferenciamento:** Exibição dos casos em um mapa interativo, com marcadores posicionados pelas coordenadas geográficas
* **Busca Dinâmica:** Filtros por cidade, bairro e tipo de doença
* **Interface Intuitiva:** Design responsivo e adaptado para atuação em campo
* **Feedback Visual:** Animações e diálogos interativos para orientação e validação de ações
* **Validação de Entrada:** Máscaras de formatação para CPF, CEP, datas, e outros dados
* **Armazenamento Local:** Salvamento de dados como IP configurável e token de sessão usando **Shared Preferences**
* **Mapa Integrado com Geoapify:** Visualização dos casos geolocalizados usando tiles customizados e marcadores no mapa

---

## 🚀 Tecnologias Utilizadas

### 📱 Frontend (App Mobile)

* **Dart:** Linguagem de programação para todo o app
* **Flutter:** Framework UI multiplataforma para Android e iOS
* **Flutter Map:** Biblioteca de mapas baseada no Leaflet
* **Geoapify Maps API:** Serviço de tiles para renderização de mapas customizados
* **Dio:** Cliente HTTP robusto para consumo de APIs REST
* **Shared Preferences:** Armazenamento local de dados simples
* **Flutter Animate:** Animações personalizadas para transições e feedback visual
* **Flutter Spinkit:** Indicadores de carregamento animados
* **Awesome Dialog:** Diálogos estilizados e personalizados
* **Mask Text Input Formatter:** Máscaras para inputs como CPF, CEP e datas
* **Intl:** Internacionalização e formatação de datas e números
* **Google Fonts:** Tipografia customizada via Google Fonts

---

## 📦 Principais Dependências Flutter

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  dio: ^5.0.0
  flutter_spinkit: ^5.1.0
  shared_preferences: ^2.0.15
  flutter_animate: ^4.0.0
  awesome_dialog: ^3.0.2
  mask_text_input_formatter: ^2.3.0
  intl: ^0.18.0
  google_fonts: ^6.1.0
  flutter_map: ^5.0.0
  latlong2: ^0.9.0
```

---

## 📱 Mockup

### Aplicativo HealthCheck

<img src="https://github.com/GabrielHR0sa/HealthCheck_front-end/blob/main/mockups/telas.png?raw=true">

---

Se quiser, posso montar também a versão em inglês ou incluir um diagrama resumido de arquitetura/fluxo de dados entre app → API → banco. Quer? 🚀
