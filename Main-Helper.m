%This work was produced by Jesus Garcia 


function U = script_runner(X)
    N = 50;
    numCols = 10;
    numRows = ceil(4*N/numCols);
    d = sqrt(size(X,2));
    
    figure;
    set(gcf, 'color', 'white');
    set(gcf, 'Position', [520 85 1020 720]); % This command will re-size the plot
    for i=1:size(X, 1);
        subplot(numRows, numCols, i);
        img = reshape(X(i,:),d,d)';          % Convert each row into a 28x28 matrix
        imagesc(img);                        % Plot the img
        set(gca, 'xtick',[]);
        set(gca, 'ytick',[]);
    end;
    colormap(gray);
    saveas(gcf, 'digit_image.jpg','jpeg');
    [U, Z, S] = pca(X);
    
    rank = 2
    rank2 = 50
    W2 = Z(:,1:rank)*diag(S(1:rank))*U(:,1:rank)';
    W50 = Z(:,1:rank2)*diag(S(1:rank2))*U(:,1:rank2)';
    save('MAT-U.mat', 'U');
    save('MAT-Z.mat', 'Z');
    save('MAT-W2.mat', 'W2');
    save('MAT-W50.mat', 'W50');


    return;
        
        
    
function script_runner_postPCA(X, number)
    N = 50;
    numCols = 10;
    numRows = ceil(4*N/numCols);
    d = sqrt(size(X,2));
    
    figure;
    set(gcf, 'color', 'white');
%    set(gcf, 'Position', [520 85 1020 720]); % This command will re-size the plot
    for i=1:size(X, 1);
        subplot(numRows, numCols, i);
        img = reshape(X(i,:),d,d)';          % Convert each row into a 28x28 matrix
        imagesc(img);                        % Plot the img
        set(gca, 'xtick',[]);
        set(gca, 'ytick',[]);
    end;
    colormap(gray);

    st1 = 'digit_image_postPCA'
    st2 = number
    filename = append(st1, st2)
    saveas(gcf, filename,'jpeg');
    
    return;
    
    
function W = dimensionality_reduction(Z)
    
    figure;
    set(gcf, 'color', 'white');
    plot(Z(1:50,1),Z(1:50,2), 'r*');
    hold on
    plot(Z(51:100,1),Z(51:100,2), 'b+');
    plot(Z(101:150,1),Z(101:150,2), 'ko');
    plot(Z(151:200,1),Z(151:200,2), 'gv');
    hold off
    saveas(gcf, 'reduced_dimensions' ,'jpeg');

    return
    
    
function Ranked(X, number)
    N = 50;
    numCols = 10;
    numRows = ceil(4*N/numCols);
    d = sqrt(size(X,2));
    
    figure;
    set(gcf, 'color', 'white');
%    set(gcf, 'Position', [520 85 1020 720]); % This command will re-size the plot
    for i=1:size(X, 1);
        subplot(numRows, numCols, i);
        img = reshape(X(i,:),d,d)';          % Convert each row into a 28x28 matrix
        imagesc(img);                        % Plot the img
        set(gca, 'xtick',[]);
        set(gca, 'ytick',[]);
    end;
    colormap(gray);

    st1 = 'Question_5E'
    st2 = number
    filename = append(st1, st2)
    saveas(gcf, filename,'jpeg');
    
    return;    
