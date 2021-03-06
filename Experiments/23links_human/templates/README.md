The human body is modeled as an articulated multi-body system with a certain number
 of links connected by joints.  The model consists of simple geometric shapes
 (parallelepiped, cylinder, sphere) whose dimensions are dependent from the
 Xsens motion acquisition by making the model dimensions 'scalable' for different
 subjects.  Due to the strong dependency from the Xsens model (23-links
 biomechanical model), we reconstruct our model in a very similar way for
 a better matching with the data coming from the suit.

[This](https://github.com/claudia-lat/MAPest/blob/master/Experiments/23links_human/misc/humanModelpng.png)
 is a general overview of how our choice of model looks like.  It is worth
 to note that we consider 1-DoFs revolute joints and combination of them
 to obtain a series of joints with a higher number of DoFs.  Due to the
 physiological constraints of the human joints, we use a model of 48 DoFs
(see [here](https://github.com/claudia-lat/MAPest/blob/master/Experiments/23links_human/misc/modelDoFs_description.png)
 a description of each joint allowed movements that justifies this choice).
As a straightforward consequence, this choice implies the presence of
 'fake' links (denoted in the templates with *name-of-the-link_f*)
 with mass and dimensions negligible.
