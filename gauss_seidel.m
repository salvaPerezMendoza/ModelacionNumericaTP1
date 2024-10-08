function [phi, error_hist] = gauss_seidel(A, rho, tol, max_iter)
    n = length(rho);           % Tamaño del sistema
    phi = ones(n, 1);          % Vector inicial de soluciones
    error_hist = zeros(max_iter, 1); % Historial de errores

    for iter = 1:max_iter
        for j = 1:n
            resta = 0;

            for k = 1:j-1
                resta = resta + A(j, k) * phi(k);
            end

            for k = j+1:n
                resta = resta + A(j, k) * phi(k);
            end

            phi(j) = (rho(j) - resta) / A(j, j);
        end

        % Calcular el error
        error_hist(iter) = norm(A*phi - rho, inf);

        % Comprobar la convergencia
        if error_hist(iter) < tol
            error_hist = error_hist(1:iter);  % Truncar historial al número de iteraciones reales
            break;
        end
    end
end

