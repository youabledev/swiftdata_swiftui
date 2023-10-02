#  Container & Context

## Container
- data persisted here 
- ModelContainer를 설정하면 ModelContext로 부터 데이터를 가져오거나 저장할 준비가 완료됨
- 앱의 스키마를 관리하기 위한 객체
- "모델 저장소"를 구성함


## Context
- working changes
- 모델에 대한 모든 변경사항을 관찰하며 이에 대한 작업들을 제공함
- 업데이트 추적, 데이터 로드, 변경사항 저장, 변경사항 취소 등
- 모델의 fetch, insert, delete를 가능하게 하며 디스크 저장소에 변경사항을 저장하는 객체
- context가 container에 저장하는 역활을 수행함

