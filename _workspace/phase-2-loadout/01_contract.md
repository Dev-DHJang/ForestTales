# 계약

- 적용 순서: Character → root-to-leaf Job chain → optional Accessory.
- 각 Resource 내부의 동일 stat/slot 중복 쓰기는 `conflict`로 원자 실패한다.
- `LoadoutBuildResult`는 성공 profile 또는 구조화 오류 코드만 가진다. 기본 캐릭터 fallback·부분 profile은 금지한다.
- AccessoryData는 rarity/grade 필드를 두지 않는다.
