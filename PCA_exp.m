clear
load('USPS.mat');
[coeff, score] = pca(A, 'Centered', 'off');
p_vals = [10, 50, 100, 200];
errors = zeros(size(p_vals));
figures = [];

for p = p_vals
    reconstructed = score(:, 1:p) * coeff(:, 1:p)';
    reconstructed = reshape(reconstructed(2, :), 16, 16);
    figures = [figures, reconstructed'];
end

for i = 1:4
    subplot(1, 4, i)
    l_index = (i - 1) * 16 + 1;
    r_index = l_index + 15;
    imshow(figures(:, l_index:r_index))
end
