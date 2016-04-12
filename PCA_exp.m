clear
load('USPS.mat');
[coeff, score] = pca(A, 'Centered', 'off');
p_vals = [10, 50, 100, 200];
errors = zeros(size(p_vals));

for p = p_vals
    reconstructed = (score(:, 1:p) * coeff(1:p)')';
    reconstructed = reshape(reconstructed, 16, 16);
    imshow(reconstructed);
    pause
end