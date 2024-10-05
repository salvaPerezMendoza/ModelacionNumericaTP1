function phi = gauss_seidel(A, rho, max_iter, tol)
    n = length(rho);           % Tamaño del sistema
    phi = ones(n, 1);          % Vector inicial de soluciones

    for iter = 1:max_iter
        for j = 1:n
            resta = 0;

            % Sumar los valores anteriores ya actualizados (phi_new)
            for k = 1:j-1
                resta = resta + A(j, k) * phi(k);
            end

            % Sumar los valores que no han sido actualizados aún (phi)
            for k = j+1:n
                resta = resta + A(j, k) * phi(k);
            end

            % Actualizar el valor de phi(j)
            phi(j) = (rho(j) - resta) / A(j, j);
        end

        % Comprobar la convergencia
        if norm(A*phi - rho, inf) < tol
            break;  % Si la diferencia es menor que la tolerancia, salir del bucle
        end
    end
end

