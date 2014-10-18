.. _introduction_methodes_numeriques :

==========================================
Introduction aux méthodes numériques
==========================================


.. _exercice1:

Exercice 1
==========

.. sidebar:: Objectif

	Observer la différence entre le calcul **algébrique** et le calcul **numérique**


1- Calculer **algébriquement** les expressions suivantes:

.. math::

	\begin{eqnarray}
	x&=&0.6+0.2+0.2+0.2\\
	y&=&\sqrt{2}*\sqrt{2}-2\\
	z&=&1-3*(\dfrac{4}{3}-1)
	\end{eqnarray}

=====


2- Calculer **numériquement** les expressions ci-dessus en utilisant le logiciel *Matlab* et le **format long** pour afficher les résultats

.. code-block:: matlab
	
	%mettre le format en long
	format long

	%affectation de x avec un affichage
	x=0.6+0.2+0.2+0.2

	%calcul de y en utilisant la fonction racine(==> sqrt)
	y=sqrt(2)*sqrt(2)-2
	
	%Calcul de la valeur de z
	z=1-3*(4./3-1)

.. note:: 
		
	* le **codage** en Matlab est en double précision, et la fonction *format* ne change pas le codage mais plutôt l'affichage, pour les autres formats disponibles::

	    help format

	* dans le calcul de la formule de **z** on a utiliser **4./3** pour éviter la division entière.
	
pour **y** et **z**, on obtient pas la même valeur algébrique, car :math:`\sqrt{2}` ne peut être correctement représentée par la machine, idem pour :math:`\dfrac{4}{3}`. 
Pour l'expression **x**, ce qui n'est pas le cas car  :math:`0.2` et :math:`0.6` **correctement** représentées.


.. _exercice2:

Exercice 2
===========

.. sidebar:: Objectif

	Comparer la représentation **tronquée** et la représentation **arrondie**.

On considère le nombre réel :math:`x=\dfrac{1}{15}` 

1- Donner la représentation **tronquée** à 5 chiffres en base 10, l'erreur absolue et l'erreur relative.::
	
	la valeur de x est:
	x=0.0666666666...

donc la représentation tronquée est

.. math::
	\begin{eqnarray}
	x_t&=&0.06666\\
	E_{abs}&=&|x-x_t|=6.6\;10^{-6}\\
	E_{rel}&=&\dfrac{|x-x_t|}{|x|}=1\;10^{-4}
	\end{eqnarray}

=====


2- Donner la représentation **arrondie** à 5 chiffres en base 10, avec l'erreur absolue et l'erreur relative.

.. math::
	\begin{eqnarray}
	x_{arr}&=&0.06667\\
	E_{abs}&=&|x-x_{arr}|=3.3\;10^{-6}\\
	E_{rel}&=&\dfrac{|x-x_{arr}|}{|x|}=4\;10^{-5}
	\end{eqnarray}
	

3- Commenter les résultats.

.. note::

	l'erreur d'arrondie est inférieure à celle de troncature, 

.. _exercice3:

Exercice 3
===========

.. topic:: Objectif

	Codage des nombres.


1. Calculer la représentation du nombre :math:`(101.11)_2` dans la base 10.

**partie entière**

.. math::
	
	(101)_2=\mathbf{1}*2^2+\mathbf{0}*2^{1}+\mathbf{1}*2^{0}=4+1=\mathbf{5}

**partie réelle**

.. math::

	(.11)_2=\mathbf{1}*(\frac{1}{2})^1+\mathbf{1}*(\frac{1}{2})^2=\dfrac{1}{2}+\dfrac{1}{4}=0.75

donc

.. math::
	
	\begin{equation}
	(101.11)_2=5.75
	\end{equation}

.. todo::

	ajouter accolade inférieure

=====


2. Calculer la représentation des nombres :math:`0.1` et :math:`\dfrac{1}{3}` dans la base **2**.
   
.. math::

	\begin{array}[|l|c|r]
	 \hline
	  0.1*2=\mathbf{0}.2 & \rightarrow & rep=0.\mathbf{0} \\
	  0.2*2=\mathbf{0}.4 & \rightarrow & rep=0.0\mathbf{0} \\
	  0.4*2=\mathbf{0}.8 & \rightarrow & rep=0.00\mathbf{0} \\
	  0.8*2=\mathbf{1}.6 & \rightarrow & rep=0.000\mathbf{1} \\
	  0.6*2=\mathbf{1}.2 & \rightarrow & rep=0.0001\mathbf{1} \\
	\end{array}

La représentation de :math:`0.2` est cyclique avec un cycle :math:`0011`

donc

.. math::

	0.1=(0.0001100110011\ldots)

de même pour :math:`\dfrac{1}{3}` on trouve::

	1/3=0.010101...

=====


3. Représenter dans la norme *IEEE* les nombres:

     a) x=-9.5
     b) y=6.625
     c) z= :math:`\frac{1}{10}` 


**Codage de x**

partie entière::

	9=(8+1)=(1001)_2

partie réelle

.. math::

	\begin{array}[|l|c|r]
	 \hline
	  0.625*2=\mathbf{1}.25 & \rightarrow & 0.\mathbf{1} \\
	  0.25*2=\mathbf{0}.5 & \rightarrow & 0.10 \\
	  0.5*2=\mathbf{1} & \rightarrow & 0.101 \\
	\end{array}

donc::
	
	6.625=1001.101

Mise en forme **normalisée** pour éliminer le bit fontôme::

	6.625=1.00110*2^3

en **simple précision** on utilise *8 bits* pour l'exposant donc la valeur du **décalage** est.

.. math:: 
	
	decalage=2^{(8-1)}-1=127


donc l'exposant à coder est ::

	E=3+127=130=(10000010)

et la mantisse est la partie après la virgule, remplie de :math:`0` **vers la droite** pour obtenir *23 bits*::

	M=00110000000000000000000

ce qui donne le codage de x.

.. math::

	x=\underbrace{0}_{signe}\;\underbrace{10000010}_{exposant}\;\underbrace{00110000000000000000000}_{mantisse}

pour plus de détails voir (`IEEE_754`_)

.. _IEEE_754: http://fr.wikipedia.org/wiki/IEEE_754

=====


4. Donner la représentation en simple précision sur un ordinateur du nombre :math:`+1101.1`

	* sans tenant compte du **bit fontôme**.
	* en tenant compte du **bit fontôme**.

Solution


* Le nombre est positif dans la valeur du bit signe est :math:`s=0`
* forme normalisée::
	
	1.1011 2^3
* exposant::
  	
  	E=3+127=130=(10000010)_2

* Mantisse sans tenant compte du **bit fontôme**::

    M=11011000000000000000000

Ce qui donne 

.. math::
	
	E_{1}=\underbrace{0}_{signe}\;\underbrace{10000010}_{exposant}\;\underbrace{11011000000000000000000}_{mantisse}

* Mantisse en tenant compte du **bit fontôme**::
  	
	M=10110000000000000000000

.. math::

	E_{1}=\underbrace{0}_{signe}\;\underbrace{10000010}_{exposant}\;\underbrace{10110000000000000000000}_{mantisse}	

=====

5. En utilisant le logiciel **Matlab** calculer le plus grand **entier** naturel tel que :math:`\mathbf{e^n}` est représentée dans la machine.
  
.. hint::

	* Consulter la documentation de la fonction **isfinite**::

	    help isfinite

	* Penser à une boucle **while**



.. literalinclude:: ../codes/tp01/exercice3_1.m
	:language: matlab
	:linenos:
	:emphasize-lines: 8

=======

6. Déterminer l'ensemble :math:`\mathcal{F}(2,3,-1,3)` ? 

L'ensemble :math:`\mathcal{F}(\beta,t,L,U)` des nombres a virgules flottante est défini par:

.. math::

	\mathcal{F}=\{y=\pm\;m\beta^{e-t},(m,e) \in \mathbb{Z}^2/ \beta^{t-1}\leq m \leq \beta^t -1, L \leq e \leq U \}

* :math:`\beta` s'appelle la **base**.
* :math:`t` est la **précision**.
* :math:`L, U` l'intervalle de l'exposant.
* le plus petit nombre en valeur absolue :

.. math::

	\beta^{t-1}\beta^{L-t}=\beta^{L-1}

* le plus grand nombre :

.. math::
	
	(\beta^{t}-1)\beta^{U-t}=\beta^{U}(1-\beta^{-t})

* et finalement le cardinal de :math:`\mathcal{F}` est :

.. math::

	\begin{eqnarray}
	card(\mathcal{F})&=&card([-1,1])*card([\beta^{t-1},\beta^{t}-1])*card([L,U])\\
	                 &=&2*(\beta^{t}-1-\beta^{t-1}+1) *(U-L+1)\\
	                 &=&2*(\beta^{t-1}(\beta-1))*(U-L+1)
	\end{eqnarray}

donc pour :math:`\mathcal{F}(2,3,-1,3)` on trouve:


* min= :math:`2^{-1-1}=2^{-2}=0.25`

* max= :math:`2^3*(1-2^{-3})=7`
* :math:`card(\mathcal{F})=2*(2^2*(2-1))*(3+1+1)=40`

* partie positive de :math:`\mathcal{F}`::

	{0.25 ,0.3125, 0.375,0.4375,0.5,0.625,0.75,0.875}
	{1,1.25,1.5 ,1.75}
	{2,2.5,3,3.5}
	{4,5,7}


**Script Matlab**

.. literalinclude:: ../codes/tp01/exercice3_2.m
	:language: matlab



.. _exercice4:

=======

Exercice 4
===========

.. topic:: Objectif

	Observer, à travers un exemple, la différence fondamentale entre le calcul algébrique et le calcul numérique.


1. Sous *Matlab*, calculer les expressions:

.. math::

	y=\dfrac{(x+1)-1}{x}

et 

.. math::

	z=\dfrac{x+(1-1)}{x}

pour :math:`x=10^{-7},10^{-8},\ldots,10^{-17}`

.. literalinclude:: ../codes/tp01/exercice4.m
	:language: matlab

2. Que constatez-vous?

.. todo::
	
	ecrire un commentaire.
