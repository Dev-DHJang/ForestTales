# 04. 기술 아키텍처

## 기본 원칙

- Godot 4.x와 typed GDScript를 사용한다.
- 데이터는 Resource, 동작은 작은 책임의 컨트롤러로 분리한다.
- 표시 이름 대신 StringName ID를 영속 식별자로 사용한다.
- 같은 초기 상태, 의미 입력과 물리 tick은 같은 전투 결과를 만든다.
- 소스 Resource는 매치 중 직접 수정하지 않고 런타임 프로필을 복제·조합한다.

## 데이터 계약

| Resource | 최소 책임 |
| --- | --- |
| CharacterData | ID, 기본 능력치·기술·패시브·태그·직업 트리와 시각 참조 |
| CharacterStats | 생존, 무게, 이동, 점프, 중력과 대시 값 |
| AttackData | 단계, 피해, 넉백, hitbox, 전달 방식과 재타격 조건 |
| MoveSetData | 의미 공격 슬롯과 후속 확장 슬롯 |
| JobData | 부모·단계, 능력치·기술·패시브·태그와 전투 규칙 변경 |
| AccessoryData | 기본 변경, 기술 패치, 조건 효과와 태그 시너지 |
| StageData | 경기장 ID, 플랫폼, 스폰, 링아웃 경계와 시각 참조 |

조합 순서는 CharacterData, 누적 JobData, AccessoryData이며 결과는 RuntimeCombatProfile이다. 정확한 병합 우선순위와 실패 방식은 Phase 2 계약에서 버전과 함께 확정한다.

## 2D 런타임 경계

- 파이터 루트 후보는 CharacterBody2D다.
- Hurtbox와 Hitbox는 Area2D 및 CollisionShape2D로 시각 노드와 분리한다.
- 경기장 플랫폼은 StaticBody2D와 CollisionShape2D, 링아웃은 Area2D로 구성한다.
- Camera2D와 HUD는 전투 상태를 소비하며 결과를 생산하지 않는다.
- AnimatedSprite2D와 SpriteFrames는 시각 상태를 표현할 뿐 공격 활성 구간을 결정하지 않는다.

## 책임 분리

| 구성 요소 | 책임 |
| --- | --- |
| CombatCommandSource | 터치·AI·디버그 입력을 같은 의미 명령으로 변환 |
| MovementController | X/Y 이동, 점프, 중력과 대시 |
| FighterStateMachine | 전이, 행동 잠금과 취소 |
| AttackController | AttackData 단계 진행과 권위 hitbox 제어 |
| HitResolver | 적중 중복·자가 타격 방지와 결과 전달 |
| CombatMath | 피해·경직·넉백 공식의 단일 위치 |
| LoadoutBuilder | 소스 비변경 런타임 프로필 생성 |
| VisualAdapter | 의미 상태·이벤트를 애니메이션과 VFX로 표현 |

## 미래 온라인 경계

온라인 프로토콜, 권위 모델, 재접속과 저장 형식은 Phase 7 이전에 확정하지 않는다. 그 전에는 전투의 결정론성과 명령 소스 교체 가능성만 보존한다.
