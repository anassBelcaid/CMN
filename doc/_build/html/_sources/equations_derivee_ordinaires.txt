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
.
**Méthode Euler Explicite**

.. literalinclude:: ../codes/tp02/euler_explicite.m
    :language: matlab
    :linenos:

**Script principal de résolution**

.. literalinclude:: ../codes/tp02/exercice1.m
    :language: matlab
    :linenos:
    :emphasize-lines: 9
