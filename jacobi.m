function phi = jacobi(A, rho, tol, max_iter)
    n = length(rho);
    phi = ones(n, 1);        % Inicialización del vector de soluciones
    phi_new = phi;           % Inicialización para almacenar las nuevas iteraciones

    for k = 1:max_iter

        resta = 0;

        for i = 1:n
           for j = 1:n

             if j != i
               resta = resta + A(i, j) * phi(j);
             end

           end

    phi_new(i) = (rho(i) - resta) / A(i, i);

        %convergencia

        if norm(phi_new - phi, inf) < tol
            break;
        end

        phi = phi_new;  % Actualizar la solución
    end
end

