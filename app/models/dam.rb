class Dam < ApplicationRecord
  has_many :distributes, dependent: :destroy
  belongs_to :region
  belongs_to :prefecture

  attachment :dam_image

  enum dam_type:{'G（重力式コンクリートダム）': 0, 'HG（中空重力式コンクリートダム）': 1, 'A（アーチ式コンクリートダム）': 2, 'GA（アーチ重力式コンクリートダム）': 3, 'E（アースダム）': 4, 'R（ロックフィルダム）': 5, 'MB（可動堰）': 6, 'CSG（台形CSGダム）': 7, 複合ダム: 8}
end
