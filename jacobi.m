function [phi, error_hist] = jacobi(A, rho, tol, max_iter)
    n = length(rho);
    phi = ones(n, 1);        % Inicialización del vector de soluciones
    phi_new = phi;           % Inicialización para almacenar las nuevas iteraciones
    error_hist = zeros(max_iter, 1); % Historial de errores

    for k = 1:max_iter
        for i = 1:n
            resta = 0;
            for j = 1:n
                if j != i
                    resta = resta + A(i, j) * phi(j);
                end
            end
            phi_new(i) = (rho(i) - resta) / A(i, i);
        end

        % Calcular el error
        error_hist(k) = norm(phi_new - phi, inf);

        % Verificar convergencia
        if error_hist(k) < tol
            error_hist = error_hist(1:k);  % Truncar historial al número de iteraciones reales
            break;
        end

        phi = phi_new;  % Actualizar la solución
    end
end

