- Region: 다중 AZ로 구성. AZ간에 어플리케이션과 데이터 실시간 복제
- AZ: 하나 이상의 데이터 센터로 구성
- 서울: AZ 4개
- CDN Computer Delivery Network
- 전력 끊길 대비: 멀티 AZ, 멀티 리전 구성

# AWS VPC Virtual Private Cloud
- 사용자가 정의한 가상의 네트워크 공간
- 하위에 퍼블릭 서브넷 (인터넷과 통신 가능), 프라이빗 서브넷 (인터넷과 통신 분리) 존재
- 퍼블릿 IP: 유동, Elastic IP: 고정
## Step
1. AWS Management Console; 리전 선택
2. 주소 범위 지정 (CIDR 포맷) 8비트 (0 ~ 255) * 2개 = 65,536. 10.0. (고정) 0.0 <- 이 두개 왜냐면 "/16"이니까. "/24"면 8비트 * 1개가 변경 가능. VPC 생성 후 변경 불가
    - 10.0.0.0/16
    - 서브넷도 추후 변경 불가
3. 라우팅 테이블: Destination, Target 명시
    - 별도 지정 없으면 주 라우팅 테이블 사용
    - 인터넷 - 인터넷 게이트웨이 - 라우팅 테이블 - 퍼블릭 서브넷
    - 프라이빗 테이블: 통신 불가
4. NACL (Network ACL)
    - Action: Deny 특정 소스 차단
    - SG에서 허용할 것을 명시해야 함.

# Gateway
## Internet Gateway (IGW)
- 퍼블릿 서브넷 내에 NAT 게이트웨이 프로비저닝.
## Transit Gateway
- 수많은 VPC들을 자유롭게 연결

# VPC Peering
- VPC간의 연결: VPC Peering을 통해 할 것을 권장.
- 1:1 연결 (경유 불가)

# VPCE VPC Endpoint

# VPC flow logs
- CloudWatch Logs: 최대 90일간 로그 저장

# EC2
## 인스턴스 스토어
- 인스턴스의 로컬 저장소 (임시).
- 데이터 복제 미지원
- Running
  - 과금 발생
- Stopped
- Terminated
  - 완전 제거되어 시작이나 정지 불가.
## 종류?
- 범용 GPU (P)
## 표기
- M5d.xlarge; large는 2vCPU와 거의 동일합니다.
## Auto Scaling
## Launch Templates
- Auto scaling에서 인스턴스 생성 시 활용

# Amazon RDS
- 완전 관리형 데이터베이스 서비스로 이전.
- 읽기 전용 데이터베이스
- 증분식 백업 서비스 제공