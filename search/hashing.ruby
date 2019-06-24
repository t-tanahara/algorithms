# ハッシュ探索法

if ARGV.size() < 2
    p '必要な引数が足りません'
    exit
end

@search_num = ARGV[0].to_i
if @search_num > 99
    p "検索する数：#{@search_num} 桁数オーバー"
    exit
end
p "検索する数：#{@search_num}"

@num_of_target = ARGV[1].to_i
if @num_of_target > 10
    p "検索する要素数：#{@num_of_target} 桁数オーバー"
    exit
end
p "検索対象の要素数：#{@num_of_target}"

# 0~9までの数字をランダムに選択し、配列に格納
@target = (0..99).to_a.shuffle.take(@num_of_target)
p "検索対象(orginal)：#{@target}"

####### ハッシュ化処理 #######
def to_hashe_target(target)
    # ターゲットの要素数の2倍の配列を作成
    hased = Array.new(target.size() * 2)

    target.each do |value|
        i = value % 11
        while !hased[i].nil?
            i = (i + 1) % 11
        end
        hased[i] = value
    end

    return hased
end

@hashed_target = to_hashe_target @target
p "検索対象(hased)：#{@hashed_target}"

####### 探索処理 #######
def search (search_num, hashed_target)
    i = search_num % 11

    while search_num != hashed_target[i]
        i = (i + 1) % 11

        if hashed_target[i].nil?
            p "見つかりませんでした"
            return
        end
    end

    p "#{i}番目の要素が一致"
    return
end

search(@search_num, @hashed_target)