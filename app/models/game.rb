class Game < ApplicationRecord
  enum player: { 一人用:0, 二人用:1, 三人用:2, 四人用:3 }
  enum genre: { 音楽:0, ロールプレイング:1, アクション:2, テーブル:3, パズル:4, シューティング:5 }

  has_one_attached :image
  has_many :reviews
  #has_many :comments
  #has_many :nices

  def self.search(search, player, genre) #self.はUser.を意味する
    if search
       where(['title LIKE ?', "%#{search}%"]).where(player: player).where(genre: genre) #検索とuseanameの部分一致を表す。
    else
       all #全て表示させる
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
