.. _introduction_methodes_numeriques :

==========================================
Introduction aux méthodes numériques
==========================================


.. _exercice1

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
		
	* le **codage** en Matlab est en double précision, et la fonction *format* ne change pas le codage maisl plutôt l'affichage, pour les autres formats disponibles. ::

	    help format

	* dans le calcul de la formule de **z** on a utiliser **4./3** pour éviter la division entière.
	
pour **y** et **z**, on obtient pas la même valeur algébrique, car :math:`\sqrt{2}` ne peut être correctement représentée par la machine, idem pour :math:`\dfrac{4}{3}`. 
Pour l'expression **x**, ce qui n'est pas le cas car  :math:`0.2` et :math:`0.6` **correctement** représentées.
