# 오케스트레이터 산출물

## 영향 분석

작업은 브랜드, 제품 규칙, 공용 화면·에셋 ID, Penpot UI/이미지 작업법, Android 패키징과 검증을 함께 바꾸므로 orchestrator가 통합 소유한다. 현재 dirty worktree와 공용 계약 파일을 한 체크아웃에서 다루므로 쓰기는 순차 처리했다.

## 역할 순서

1. product: ADR-014·015 및 현재/미래 범위 분리.
2. contracts: 브랜드, Android, 24개 화면과 61개 에셋 ID 고정.
3. ui/image-design: Penpot 작업 절차와 master/batch 템플릿.
4. mobile: export preset, 스크립트와 별도 앱 마이그레이션 검토.
5. qa: 계약·하네스·Phase 0·Android 패키지 검증.
6. version-control: dirty 변경 보존과 원격 미작업 기록.

## 통합 경계

- 실제 Godot 비전투 UI, 이미지와 Penpot 파일은 만들지 않는다.
- 기존 캐릭터·모션·전투 변경을 보존하고 이름·소비 계약만 갱신한다.
- 과거 `_workspace`는 검색·치환과 경로 이동 대상에서 제외한다.
