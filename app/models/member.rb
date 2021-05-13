class Member < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '日向坂46' },
    { id: 2, name: '潮沙理菜' },
    { id: 3, name: '影山優佳' },
    { id: 4, name: '加藤史帆' },
    { id: 5, name: '齊藤京子' },
    { id: 6, name: '佐々木久美' },
    { id: 7, name: '佐々木美玲' },
    { id: 8, name: '高瀬愛奈' },
    { id: 9, name: '高本彩花' },
    { id: 10, name: '東村芽依' },
    { id: 11, name: '金村美玖' },
    { id: 12, name: '河田陽菜' },
    { id: 13, name: '小坂菜緒' },
    { id: 14, name: '富田鈴花' },
    { id: 15, name: '丹生明里' },
    { id: 16, name: '濱岸ひより' },
    { id: 17, name: '松田好花' },
    { id: 18, name: '宮田愛萌' },
    { id: 19, name: '渡邉美穂' },
    { id: 20, name: '上村ひなの' },
    { id: 21, name: '高橋未来虹' },
    { id: 22, name: '森本茉莉' },
    { id: 23, name: '山口陽世' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
