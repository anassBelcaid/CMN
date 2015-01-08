.. resolution_systemes_::

=========================================================
Résolution d'un système d'équations linéaires
=========================================================

.. seance1_:

Séance 1:
==========

.. topic:: Objectif

    En utilisant Matlab, résoudre un système d'équations linéaires par la méthode directe de décomposition **LU**.


1. Etant donné un circuit électrique du la **figure 1**, on souhaite calculer les valeurs efficaces des courantes :math:`i_1`, :math:`i_2`, :math:`\ldots`, :math:`i_5`. En utilisant les lois de `Kirchoff <http://en.wikipedia.org/wiki/Kirchhoff%27s_circuit_laws>`_ , déterminer les équations qui régissent ce circuit électrique.



.. figure:: circuit.png
    :scale: 100 %
    :alt:  image not found
    :align: center

    Figure 1: Schéma du circuit électrique.


2. Ecrire ces équations sous la forme de :math:`Ax=b`.

voici les équations, si on applique les deux lois de **Kirchoff**.

Neoud :math:`B`.

.. math::

    i_1-i_2-i_3=0

Noeud :math:`C`.

.. math::

    i_3-i_4-i_5=0

Circuit fermé :math:`C_1`:

.. math::

    V-i_1(5\Omega)-i_2(5\Omega)=0

Circuit fermé :math:`C_2`:

.. math::

    -i_3(7\Omega)-i_4(2\Omega)+i_2(5\Omega)=0

Circuit fermé :math:`C_3`:

.. math::

    -i_5(3\Omega)+i_4(2\Omega)=0



et donc le système est donné par:


.. math::

    \begin{pmatrix}
      1 & -1 & -1 & 0 &0 \\
      0 & 0  &  1 & -1 & -1\\
      5 & 5  & 0  & 0  & 0 \\
      0 & 5  & -7 & -2 & 0\\
      0 & 0 &0    & 2 & -3\\
    \end{pmatrix}
    \;\begin{pmatrix}
       i_1\\
       i_2\\
       i_3\\
       i_4\\
       i_5
    \end{pmatrix}=\begin{pmatrix}
       0\\
       0\\
       V\\
       0\\
       0
    \end{pmatrix}

-----

3. Pour :math:`V=10`, résoudre le système :math:`Ax=b` en utilisant l'opérateur **\\** de *Matlab*.

**Script principal**

.. code-block:: matlab

    %fixer la valeur de V
    V=10;

    %matrice A
    A=[1 -1 -1 0 0;
       0  0 1 -1 0;
       5  5 0  0 0;
       0  5 -7 -2 0;
       0  0  0 2 -3];

    %vecteur b
    b=[V;0;0;0;0];

    %résolution par l'opérateur de matlab
    x=A\b

------

4. Ecrire une fonction qui résout un système **triangulaire inférieur**.


.. literalinclude:: ../codes/tp03/rsl_tri_inf.m
    :language: matlab
    :linenos:
    :emphasize-lines: 29

.. note::

    Dans la ligne (29) , la somme :math:`\sum_{j=1}^{i-1} A_{ij}\;x_j` est formulée comme un **produit scalaire**.

-------


5. Ecrire une fonction qui résout un système linéaire **triangulaire supérieur**

.. literalinclude:: ../codes/tp03/rsl_tri_sup.m
    :language: matlab
    :linenos:

-------

6. Ecrire une fonction qui résout un système linéaire :math:`Ax=b` par la méthode de **LU**.


**Algorithme LU**::

  for k=1:n
    u(k,k)=a(k,k)

    for i=k+1:n
      l(i,k)=a(i,k)/u(k,k)
      u(k,i)=a(k,i)

    for i=k+1 : n
      for j=k+1:n
        a(i,j)=a(i,j)-l(i,k)u(k,j)





.. centered:: fonction decomposition

.. literalinclude:: ../codes/tp03/lu_dcm.m
    :language: matlab
    :linenos:


.. literalinclude:: ../codes/tp03/solve_lu.m
    :language: matlab
    :linenos:

.. centered:: script principal (suite)

.. code-block:: matlab

    %test de la solution avec lu_dcm
    fprintf('solution par la decomposition LU:')
    x1=solve_lu(A,b)

=========


.. note::

  On peut optimiser la mémoire du programme, en sauvegardant :math:`L` et :math:`U`, dans  la même matrice.


**Algorithme LU( 2)**::

  for k=1:n-1
    for i=k+1:n
      a(i,k)=a(i,k)/a(k,k)

      for j=k+1:n
        a(i,j)=a(i,j)-l(i,k)*a(k,j)


A la fin du programme, la partie triangulaire sup de :math:`A` est :math:`U`, et :math:`L` est sauvegadée dans la partie inférieure **sans sa diagonale** (implicitement =1)


.. centered:: fonction decomposition compacte

.. literalinclude:: ../codes/tp03/lu_dcm2.m
    :language: matlab
    :linenos:


.. centered:: Résolution avec la matrice compacte


.. literalinclude:: ../codes/tp03/solve2_lu.m
    :language: matlab
    :linenos:


.. seance2_:

Séance 2:
==========

.. topic:: Objectif

  En utilisant Matlab, résoudre un système d'équation linéaires par les méthodes itératives de Jacobi et de relaxation


Une méthode itérative pour résoudre un système linéaire, s'écrit sous la forme.

.. math::

    x^{(k+1)}=Bx^{(k)}+ g  \quad \forall k \ge 0

et qui doit vérifier que :math:`x` est point **stationnaire**

.. math::

    x=Bx+ g


* Puisque :math:`x=A^{-1}b` on obtient que

.. math::

  g=A^{-}(I-B)b.

* Soit :math:`e^{(k)}=x^{(k)}-x`, *l'erreur*  à l'itérations :math:`k`.

alors on obtient que

.. math::

    \begin{eqnarray}
             e^{(k+1)}&=&x^{(k+1)}-x\\
                      &=&Bx^{k}-A^{-1}(I-B)b -x\\
                      &=&Bx^{k}+A^{-1}b -Bb -A^{-1}b\\
                      &=&B(x^{k}-x)\\
                      &=&Be^{k}
    \end{eqnarray}


.. note::

  la matrice :math:`B` est appelée la matrice **d'itération**, et on a

  .. math::

      ||e^{(k)}|| \le (\rho(B))^k||e^{(0)}||


et donc pour que :math:`||e^{(k)}|| \rightarrow 0`, il faut que :math:`\rho(B)<1`.

----------

1. Résoudre le problème :math:`Ax=b` par la méthode de **Jacobi**.

La méthode de **Jacobi** consiste a prendre la matrice de précondionnement comme

.. math::

    P=D

où :math:`D` est la diagonale de :math:`A`.

Ce qui donne le schéma iteratif suivant:

.. math::

    D x^{(k+1)}=b - (A-D)x^{(k)}

ou


.. math::

    x_i^{(k+1)}=\big( b_i - \sum_{j=0\; i\ne j}^n A_{ij}x_j^{k}\big)/ A_{ii}



.. centered:: **fonction jacobi**

.. literalinclude:: ../codes/tp03/jacobi.m
    :language: matlab
    :linenos:



Pour **assurer** la convergence de la méthode on considère un système **tridiagonl** a diagonale strictement dominante.


.. literalinclude:: ../codes/tp03/mat_def_pos.m
    :language: matlab
    :linenos:


.. centered:: Script exercice2 (Version 1)


.. code-block:: matlab

  %% script pour résoudre des systèmes linéaires en utilisant différents
  % methodes iteratives
  clc
  clear all

  %% générer un système avec A définie posotive
  n=10;
  A=mat_def_pos(n);

  %on s'arrange a ce que la solution soit 1:10
  b=A*(1:n)';

  %résoudre le système avec jacobi
  [x,iter]=jacobi(A,b,zeros(size(b)),1E3,1E-2)


ce qui donne::

  x =

    0.9991
    1.9983
    2.9975
    3.9970
    4.9965
    5.9966
    6.9966
    7.9972
    8.9979
    9.9989


  iter =

    17

2. Comparer le nombre des itérations et la qualité de la solution de cette méthode en variant les tests d'arrêts.

.. code-block:: matlab

  %résoudre le système avec jacobi
  [x,iter]=jacobi(A,b,zeros(size(b)),1E3,1E-4)


donnera::

  x =

   0.999993081617482
   1.999986163234963
   2.999981308673021
   3.999976454111080
   4.999975226870633
   5.999973999630186
   6.999976940830842
   7.999979882031500
   8.999986161656901
   9.999992441282302

  >> iter

  iter =

    28

Pour voir l'évolution de **nombre d'itérations** on se propose de *tracer* la courbe du nombre d'itérations en fonction de la **taille** du système. en fixant le test d'arrêt.


.. centered:: Exercice2 (suite)

.. code-block:: matlab

  %% visualiser la courbe des nombres d'itérations
  tailles=[10,20,40,80,160,320,640,1280,2540];
  iters=zeros(size(tailles));
  L=length(tailles);

  %on sauvegarde les résultats dans un fichier
  fid=fopen('jacobi_itertions.txt','w')
  for i=1:L

    %extraire la taille
    n=tailles(i);

    %construire la matrice de taille n
    A=mat_def_pos(n);

    b=A*(1:n)';


    %résoudre le système avec jacobi
    [x,iters(i)]=jacobi(A,b,zeros(size(b)),1E3,1E-2);

    %sauvegarde des resultats
    fprintf('%d\t%d\n',n,iters(i));
  end
  fclose(fid);


  %representation graphique
  hold on
  id1=plot(tailles,iters,'b*-')
  xlabel('taille matrice');ylabel('iteration jacobi')
  title('nombre d iterations de la methode de jacobi')
  saveas(id1,'jacobi_iteration.png')

.. figure:: ../codes/tp03/jacobi_iteration.png
    :scale: 50%
    :alt:    text if image isn't found
    :align: center

    evolution du nombre d'itérations en fonction de la taille

----------

3. Résoudre le problème :math:`Ax=b` par la méthode de **relaxation**

la méthode de **relaxation** est donnée par

.. math::

    (D+\omega L)x^{(k+1)}=\big((1-\omega)D -\omega U\big)x^{k}+wb


et la formulation **scalaire** est donné par:

.. math::

  x^{(k+1)}=\omega\big( b_i - \sum_{j=1}^{i-1}A_{ij}x^{(k+1)}_j - \sum_{j=i+1}^n A_{ij}x^{k}_j \big)+(1-\omega)x_i^{(k)}



.. centered:: **Fonction relaxation**


.. literalinclude:: ../codes/tp03/relaxation.m
    :language: matlab
    :linenos:

.. centered:: **Script 2**

.. code-block:: matlab

  %% générer un système avec A définie positive
  n=10;
  A=mat_def_pos(n);

  %on s'arrange a ce que la solution soit 1:10
  b=A*(1:n)';


  %résoudre le système avec jacobi
  w=1.2;
  [x,iter]=relaxation(A,b,w,zeros(size(b)),1E3,1E-2)


on obtient::

  w =

   1.200000000000000


  x =

   0.999548399661875
   2.002243816460910
   2.999649762936567
   3.999797441638391
   4.999956473786621
   5.999999769226714
   7.000004030757512
   8.000001967834036
   9.000000575580618
  10.000000098171340


  iter =

     9

-------

4. Tracer le nombre d'itérations en fonction du paramètre :math:`\omega \;\in ]0,2[` avec un test d’arrêt fixé.


.. centered:: **Suite Script 2**


.. code-block:: matlab

  %descrtisation de la valeur de omega
  Omega=linspace(0.2,1.9,100);
  iters=zeros(100,1);

  %boucle pour calculer le nombre d'itérations

  for i=1:100

     %appel de relaxation
     [x,iters(i)]=relaxation(A,b,Omega(i),zeros(size(b)),1E3,1E-2);

  end

  id=plot(Omega,iters,'r--','lineWidth',1.5)
  title('nombre diterations en fonction de omega')
  x_label('w'); xlabel('nombre iteration')

  saveas(id,'relaxation_iterations.png')


et obient :

.. figure:: ../codes/tp03/relaxation_iterations.png
    :scale: 50%
    :alt:    text if image isn't found
    :align: center

    nombre d'itération en fonction de la valeur w.


-------------------------------
==========
Séance 3
==========

.. topic:: Objectif

  En utilisant Matlab, résoudre un système d'équations linéaires par la méthode directe de Gauss avec une stratégie de pivotation partielle.


1. Ecrire une fonction qui résout le système :math:`Ax=b` en utilisant la méthode de **Gauss**.

.. centered:: Simple script pour tester la fonction


.. literalinclude:: ../codes/tp03/exercice3_1.m
    :language: matlab
    :linenos:
    :emphasize-lines: 15


.. centered:: Gauss


.. literalinclude:: ../codes/tp03/gauss_elm_smp.m
    :language: matlab
    :linenos:

------

2. Calculer **exactement** le nombre d'opérations (+,ou -,/ et \*) utilisé pour répondre à la question 1.

Pour une matrice :math:`A^{(k)}` on doit éliminer les coefficients :math:`A^{(k)}_{i1}` pour :math:`i\in [2,k]`.

.. math::

    \begin{pmatrix} a^{(k)}_{11} &\ldots & a^{(k)}_{1k}\\
                    \vdots       &  &\vdots \\
                    a^{(k)}_{k1}& \ldots & a^{(k)}_{kk}  \end{pmatrix}


Pour chaque ligne on besoin de :math:`2k+1` opérations. et on va appliquer ceci pour toutes les lignes sauf la première, donc on aura besoin de :math:`(k-1)(2k+1)` opérations.


* L'Algorithme de **Gauss** consiste à répéter cette opération pour des sous matrices qui varient en tailles.


.. math::
    \begin{eqnarray}
    \sum_{k=2}^n (k-1)(2k+1)&=&2 \sum_{2}^{n}k^2+ \sum_{2}^{n}k -n +1\\
                            &=&\dfrac{2}{3}n^3 +\dfrac{3}{2}n^2- \dfrac{1}{6}n -1\\
                            &\approx&\dfrac{2}{3}n^3
    \end{eqnarray}


Calcul numérique de l'ordre d'un Algorithme
--------------------------------------------

Pour confirmer le résultat indiquant que l'algorithme de **Gauss** est un algorithme **cubique**, :math:`p=3`

.. math::

    T_n\approx\alpha N^{p}


où :math:`T_n` est le temps d'exécution pour une matrice de taille :math:`n`.

on se propose de confirmer numériquement cette valeur. on applique l'algorithme de Gauss pour plusieurs tailles. et on obtient la valeur de :math:`p` par la transformation suivante:

.. math::

    log(T_n)=p\;log(N)+ log(\alpha)

donc si on représente :math:`(log(N),log(T_n))`, alors l'ordre de l'algorithme n'est autre que la **pente** de cette droite.

.. figure:: ../codes/tp03/timingGauss1.png
    :scale: 60%
    :alt:    text if image isn't found
    :align: center

    graphe temps en fonction de la taille de la matrice N.


.. figure:: ../codes/tp03/timingGauss2.png
    :scale: 60%
    :alt:    text if image isn't found
    :align: center

    loglog


Et finalement on peut appliquer une **régression linéaire** pour calculer les coefficient de la droite.

.. figure:: ../codes/tp03/regression.png
    :scale: 60%
    :alt:    text if image isn't found
    :align: center

    regression

Ce qui donne l'approximation

.. math::

    p=2.4

.. note::

  Cette valeur va converger vers :math:`3` quand :math:`n \to \infty` dans la simulation.
------


3. Importance de la stratégie par pivotation.

Pour illustrer l'importance d'une stratégie de **pivotation** pour éviter les erreurs d'arrondis, on se propose de résoudre le système suivant simple

.. _systeme1:
.. math::

    \begin{pmatrix}10^{-16}& 59.14\\ 5.291 &-6.13 \end{pmatrix} \begin{pmatrix}x_1\\x_2\end{pmatrix}=\begin{pmatrix}10\\1\end{pmatrix}




Ecrire un programme ``exercice3_2.m`` pour résoudre ce système en utilisant

* gauss simple.
* décomposition de LU.


Afficher aussi les erreurs sachant que

.. math::

    x=\begin{pmatrix}1\\10\end{pmatrix}


------

4. Ecrire une fonction qui résout le système :math:`Ax=b` en utilisant la méthode de Gauss avec une stratégie de *pivotation partielle*.


.. centered:: Exercice3_3.m

.. literalinclude:: ../codes/tp03/exercice3_3.m
    :language: matlab
    :linenos:
    :emphasize-lines: 8



.. centered:: Gauss pivot partiel

.. literalinclude:: ../codes/tp03/gauss_partial_pivot.m
    :language: matlab
    :linenos:

------

5. Ajouter la méthode de **Gauss Pivot partiel** pour la résolution du système systeme1_.
