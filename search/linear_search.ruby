# 線形探索法

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
@target = (0..99).to_a.shuffle.take(@num_of_target)
p "検索対象：#{@target}"

start_time = Time.now
@target.each_with_index do |value, index|
    if @search_num == value
        p "#{index}番目の要素が一致"
        p "処理時間：#{Time.now - start_time}s"
        exit
    end
end
p "見つかりませんでした"
p "処理時間：#{Time.now - start_time}s"