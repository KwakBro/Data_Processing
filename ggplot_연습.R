data("diamonds")
# 공식 데이터셋 이용

ggplot(data = diamonds , aes(x = carat , y = price , group = cut_width(carat, width = 0.3))) +
  geom_boxplot(color = "blue" , fill = "gold" ) +
  labs(title = "Diamond Price Distribution by Carat" , x = "Carat" , y = "Price($)")
# Box plot 이용 

ggplot(data = diamonds , aes(x = carat , y = price , col = clarity)) +
  geom_point() +
  labs(title = "clarity 산포도 ", x = "Carat" , y = "Price($)")
ggplot(data = diamonds , aes(x = carat , y = price , col = color)) +
  geom_point() +
  labs(title = "color 산포도 ", x = "Carat" , y = "Price($)")
ggplot(data = diamonds , aes(x = carat , y = price , col = cut)) +
  geom_point() +
  labs(title = "cut 산포도 ", x = "Carat" , y = "Price($)")
# ggplot 연습.
