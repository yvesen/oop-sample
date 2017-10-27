class Monster

  MAX_HP = 150
  MAX_AP = 50

  attr_accessor :hp, :name                    # 設定物件外部可以直接使用和修改 name 和 hp 的 attributes

  def initialize(name, hp, ap)
    @name = name                              # 設定一個名為 name（名稱）的 attribute

    if MAX_HP < hp
      @hp = MAX_HP
    else
      @hp = hp
    end

    if MAX_AP < ap
      @ap = MAX_AP
    else
      @ap = ap
    end                                       # 設定一個名為 hp（生命值）的 attribute

    @alive = true                             # 怪獸剛被創造，所以預設為 true，表示怪獸創造時一定是活著的

    # 印出被創造的怪獸的 attributes
    puts "遇到怪獸 #{@name} 了!"
    puts "生命力(HP)：#{@hp}"
    puts "攻擊力(AP)：#{@ap}"
    puts ""
  end

  def is_alive?
    return @alive
  end

  def attack(enemy)
    damage = rand(@ap/2..@ap)                   # 傷害會隨機取攻擊力的一半（AP／2）至 AP 的數字
    enemy.hp = enemy.hp - damage                # 新的生命力是生命力減去傷害

    # 印出攻擊的過程
    puts "#{@name} 攻擊!"
    puts "#{enemy.name} 受到 #{damage} 點傷害"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點 HP"
    puts ""

    enemy.die?
  end

  def die?
    if hp < 1
      die
    end
  end

  private def die                                           # 代表死亡(戰敗)
    @alive = false
    puts "#{@name} 被打倒了"
  end
end