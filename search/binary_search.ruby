# 二分探索法
# 前提条件：探索対象は予めソートされた状態であること

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
if @num_of_target > 99
    p "検索する要素数：#{@num_of_target} 桁数オーバー"
    exit
end
p "検索対象の要素数：#{@num_of_target}"

# 0~9までの数字をランダムに選択し、配列に格納
@target = (0..99).to_a.shuffle.take(@num_of_target).sort
p "検索対象：#{@target}"

def do_search(head, tail)
    if tail - head == 1
        p "見つかりませんでした"
        return
    end

    # 小数点以下切り捨て
    center = (head + tail) / 2

    if @search_num == @target[center]
        p "#{center}番目の要素が一致"
        return
    end

    if @search_num > @target[center]
        do_search(center, tail)
    else
        do_search(head, center)
    end
end

start_time = Time.now
do_search(0, @target.size() - 1)
p "処理時間：#{Time.now - start_time}s"