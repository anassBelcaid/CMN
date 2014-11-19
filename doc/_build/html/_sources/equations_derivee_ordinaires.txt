.. _equations_derivee_ordinaire :

***************************************************
Résolution numériques des équations différentielles
***************************************************

Exercice 1
==========

On considère un milieu confiné dans lequel vivent des bactéries. :math:`y(t)` le nombre des bactéries. On suppose qu'au plus :math:`b` éléments **coexistent** et que le nombre **initial** est :math:`a`. Le **taux de croissance** des bactéries étant égal à :math:`c`, le taux de variation de cette population satisfait l'équation:


.. math::
    \begin{equation}
    y^{'}(t)-cy(t)+\dfrac{c}{b}y(t)^2=0
    \end{equation}

1. Ecrire le problème de **Cauchy**, qui sera noté :math:`(P_1)`.


On peut écrire le problème sous la forme:

.. math::

    \begin{eqnarray}
    y^{'}(t)&=&cy(t)-\dfrac{c}{b}y(t)^2
            &=&F(t,y)
    \end{eqnarray}

avec :math:`F(t,y)=cy(t)-\dfrac{c}{b}y(t)^2` est la fonction de **Cauchy**.

Ce qui donne:

.. math::

    P_1=\left\{
         \begin{array}{l}
         y^{'}(t)=F(t,y) \quad \forall t \in [0,\infty[\\
         y(0)=a
         \end{array}
       \right.

2. Vérifier que le problème admet une solution **unique**.

Pour que le problème admet une solution unique, il **suffit** que la fonction de *Cauchy* :math:`\mathbf{F}` soit **localement lipchitzienne** par rapport à :math:`y`.

.. math::

    \begin{eqnarray}
      \dfrac{\delta F(t,y)}{\delta y}&=&c- 2\dfrac{c}{b} y(t)
    \end{eqnarray}

Puisque :math:`|F(t,y)|<b` on conclut que:

.. math::

    |F(t,y)|<|c -2c|<3c

donc le problème :math:`(P_1)` admet une solution unique.


3. Calculer la solution analytique?

Le problème :math:`(P_1)` est une équation différentielle de type **Bernoulli**, qui a pour une forme générale.

.. math::

    \dfrac{dy}{dx}=P(x)y(t)+Q(x)y^n

Et qui sont résolus en posant le **changement de variable** suivant:

.. math::

    Z=Y^{(1-n)}

en disivant l'équation sur :math:`y^n` on obtient:

.. math::

    \dfrac{y^{'}}{y^n}=P(x)y^{1-n}+Q(x)

Si on écrit l'equation en fonction :math:`Z` on obtient:

.. math::

    \begin{equation}
    \big(\dfrac{1}{1-n}\big)z^{'}=P(x)z+Q(x)
    \end{equation}

Qui est un problème différentiel **linéaire** simple à résoudre.

=====

**Application**

on pose :math:`z=\dfrac{1}{y}` et on obtient

.. math::

    z^{'}(t)=-cz(t)+\dfrac{c}{b}


* Solution homogène:

.. math::

    \begin{equation}
      z_1(t)=C_1\mathbf{e}^{-ct}
    \end{equation}

* solution particulière:

.. math::

    z_2(t)=\dfrac{1}{b}

* solution finale:

.. math::

    z(t)=z_1(t)+z_2(t)=C_1\mathbf{e}^{-ct}+\dfrac{1}{b}

Ce qui donne

.. math::

    y(t)=\dfrac{1}{C_1\mathbf{e}^{-ct}+\dfrac{1}{b}}

On determine la constante :math:`C_1` par la **condition initiale**

.. math::

    \begin{eqnarray}
    y(0)&=&a\\
    C_1&=&\dfrac{b-a}{ab}
    \end{eqnarray}

et donc

.. math::

    y(t)=\dfrac{1}{\dfrac{b-a}{ab}e^{-ct}+\dfrac{1}{b}}


=====

4. Utiliser la méthode *d'Euler* pour obtenir successivement des approximations de :math:`y(0.1)`, :math:`y(0.2)`,:math:`\ldots`, :math:`y(1.0)` notées :math:`y_1,y_2,y_3,\ldots,y_{10}` dans le cas :math:`c=1,\; b=2,\; a=10`.

**Fonction de Cauchy**

.. literalinclude:: ../codes/tp02/fCauchy.m
    :language: matlab
    :linenos:


**Fonction exacte**

.. literalinclude:: ../codes/tp02/fExacte.m
    :language: matlab
    :linenos:


**Méthode Euler Explicite**

.. literalinclude:: ../codes/tp02/euler_explicite.m
    :language: matlab
    :linenos:

**Script principal de résolution**

.. literalinclude:: ../codes/tp02/exercice1.m
    :language: matlab
    :linenos:
    :emphasize-lines: 9

.. note::

    dans la ligne **9**, l'opérateur **@** est utilisé pour obtenir une **référence** à la fonction *FCauchy*.


======


Exercice 2
==========

On considère le problème de **Cauchy** suivant:


.. math::

    \begin{equation}
      (P_1)=\left\{\begin{array}[lr]
                        a y^{'}=(cot(t)-2at)y(t) & x \in [0,10]\\
                        y(\dfrac{\pi}{2})=exp(-a\dfrac{\pi^2}{4})&
                    \end{array}\right.
    \end{equation}

avec :math:`a=0.05`

1. Vérifier que :math:`y(t)=sin(t)e^{-at^2}` est une solution du prolbème :math:`(P_1)`.


.. math::

    \begin{eqnarray}
     y^{'}(t)&=&cos(t)e^{-at^2} -2at\;sin(t)e^{-at^2}\\
             &=&\big(\dfrac{cos(t)}{sin(t)}- 2at \big)e^{-2t^2}\\
             &=&\big(\mathbf{cot}(t)-2at \big) e^{-2t^2}
    \end{eqnarray}

et on vérifie facilement que :math:`y(\dfrac{\pi}{2})=exp(-a\dfrac{\pi^2}{4})`.

2. Résoudre le problème en utilisant la méthode **D'Euler**

**fonction de Cauchy**

.. literalinclude:: ../codes/tp02/fCauchy2.m
    :language: matlab
    :linenos:


**Fonction exacte**

.. literalinclude:: ../codes/tp02/fExacte2.m
    :language: matlab
    :linenos:


**Script principale**

.. literalinclude:: ../codes/tp02/exercice2.m
    :language: matlab
    :linenos:


3. Résoudre le problème :math:`(P_1)` en utilisant la méthode de **Heun** et tracer la solution numérique.

le schéma de la méthode de **Heun** est le suivant:

.. math::

    \left\{ \begin{array}[l]
       a\tilde{y}_{i+1}=y_i+hf(t_i,y_i)\\
       y_{i+1}=y_i +\dfrac{h}{2}\big(f(t_i,y_i)+f(t_{i+1},\tilde{y}_{i+1})\big)
             \end{array} \right.


**Fonction de Heun**

.. literalinclude:: ../codes/tp02/Heun.m
    :language: matlab
    :linenos:

4. Résoudre le problème :math:`(P_1)` en utilisant la méthode de **Runge Kutta** d'ordre *4* et tracer la solution numérique.


la méthode de **Runge-kutta** est définie par:

.. math::

    \begin{equation}
      y_{n+1}=y_n+ \dfrac{h}{6}(k_1+2k_2+2k_2+k_4)
    \end{equation}

avec:

.. math::

    \begin{eqnarray}
    k_1&=&f(t_n,y_n)\\
    k_2&=&f(t_n+\dfrac{h}{2},y_n+\dfrac{1}{2}k_1h)\\
    k_2&=&f(t_n+\dfrac{h}{2},y_n+\dfrac{1}{2}k_2h)\\
    k_4&=&f(t_n+h,y_n+k_3h)
    \end{eqnarray}


**Fonction Runge Kutta**

.. literalinclude:: ../codes/tp02/rungeKutta.m
    :language: matlab
    :linenos:


5. Afficher les **erreurs** de discrétistaion locale des méthodes ci-dessus:


pour pouvoir construire un tel **fichier** on aura besoin d'une fonction **matlab** pour écrire dans un fichier.


.. code-block:: matlab

    fileId=fopen(fileName,'permission')

et après utiliser la fonction **fprintf** pour sauvegarder les valeurs.

.. code-block:: matlab

    fprintf(fileId,'code',valeurs)

donc pour construire le fichier.

.. code-block:: matlab

    fid=fopen('erreurs.txt','w');
    %calculer la longeur
    n=length(X);

    %calcul des erreurs
    Err_e=abs(E-Y)
    Err_h=abs(E-H)
    Err_r=abs(E-R)

    %boucle pour remplir le fichier
    for i =1:n
        fprintf(fid,'%f\t%f\t%f\n',Err_e(i),Err_h(i),Err_r(i))
    end

