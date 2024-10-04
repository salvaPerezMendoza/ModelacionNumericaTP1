function [Matriz_A, rho] = generar_sistema(n)
    h = 1 / (n - 1);           % Paso
    A = zeros(n, n);           % Inicializar matriz A
    rho = zeros(n, 1);         % Inicializar vector rho

    % Definir la matriz tridiagonal A
    for i = 2:n-1
        A(i, i-1) = -1;        % Diagonal inferior
        A(i, i) = 2;           % Diagonal principal
        A(i, i+1) = -1;        % Diagonal superior
    end

    % Condiciones de borde
    A(1, 1) = 1;               % Primera fila
    A(n, n) = 1;               % Última fila

    % Definir el vector independiente rho
    for j = 2:n-1
        xj = h * (j - 1);
        rho(j) = h^2 * (-xj * (xj + 3) * exp(xj));
    end

    % Condiciones de borde para rho
    rho(1) = 0;
    rho(n) = 0;
end

