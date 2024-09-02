# SmartFarm Contract

이 프로젝트는 Arbitrum Sepolia 네트워크에 배포되는 스마트 계약을 포함하고 있습니다. 아래 명령어들을 사용하여 스마트 계약을 컴파일하고, 배포할 수 있습니다.

## 사전 준비
프로젝트를 실행하기 전에, 필수적인 의존성을 설치하고 `.env` 파일을 설정하세요. `.env` 파일에는 Infura API 키와 Sepolia 네트워크에서 사용할 개인 키를 설정해야 합니다.

```bash
npm install
```

```plaintext
INFURA_API_KEY=your_infura_api_key_here
SEPOLIA_PRIVATE_KEY=your_sepolia_private_key_here
```

## Command

**Smart Contract Compile**

```bash
npx hardhat compile
```
이 명령어는 프로젝트의 스마트 계약을 컴파일하여 artifacts/ 및 cache/ 디렉토리에 컴파일된 파일을 생성합니다.



**Token Contract Deploy**

`scripts/deploy-token.js` 스크립트를 사용하여 Token 스마트 계약을 Arbitrum Sepolia 네트워크에 배포:

```bash
npx hardhat run scripts/deploy-token.js --network arbitrum-sepolia
```
이 명령어는 Arbitrum Sepolia 네트워크에 스마트 계약을 배포하며, 배포된 계약의 주소가 출력됩니다.



**Waste Contract Deploy**

`scripts/deploy-waste.js` 스크립트를 사용하여 Waste 스마트 계약을 Arbitrum Sepolia 네트워크에 배포하려면 다음 명령어를 실행하세요:

```bash
npx hardhat run scripts/deploy-waste.js --network arbitrum-sepolia
```
이 명령어도 마찬가지로 Arbitrum Sepolia 네트워크에 Waste 스마트 계약을 배포하고, 배포된 계약의 주소가 출력됩니다.