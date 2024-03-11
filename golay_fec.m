% 生成24位随机数
random_data = randi([0, 1], 1, 24);

% 显示生成的随机数
disp('生成的随机数：');
disp(random_data);

% 调用 fec_encode 函数进行golay编码和交织处理
interleave_code = fec_encode(random_data);

%模拟传输错误，随机两位数据翻转
corrupted_code = simulate_transmission_errors(interleave_code,2);

% 调用 fec_decode 函数进行golay解码和解交织处理
data = fec_decode(corrupted_code);

disp('解码数据：');
disp(data);

% 计算不一致的位数
num_errors = sum(random_data ~= data);

% 显示结果
disp(['原始数据与接收数据不一致的位数：', num2str(num_errors)]);


