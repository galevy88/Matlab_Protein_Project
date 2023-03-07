function comp = d10dist(crd1,crd2)
% MATLAB for biologists - Class demonstration
% calculate all distances between 2 sets of coordinates of any dimension
% in the result, rows relate to crd1, columns relate to crd2
Ndim = size(crd1,2);  % assume crd1 and crd2 are of the same dimension
comp = zeros(size(crd1,1),size(crd2,1)); % initialize matrix or distances
for n=1:Ndim
    col1 = crd1(:,n);
    row2 = crd2(:,n)';
    comp = comp + (col1-row2).^2; % implied expansion, columns with rows
end
comp = sqrt(comp);

end

