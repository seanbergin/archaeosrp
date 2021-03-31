---
title: 'CHIME ABM: Modeling information flow and decision making during hurricane threats'
tags:
  - evacuation decisions
  - hurricanes
  - risk communication
  - agent-based modeling
  - Netlogo
authors:
  - name: Sean M. Bergin
    orcid: 0000-0001-9576-7914
    affiliation: 1
  - name: Joshua Alland
    orcid: 0000-0003-4784-5214
    affiliation: 2
  - name: Rebecca Morss
    orcid: 
    affiliation: 2
  - name: Michael Barton
    orcid: 
    affiliation: 1
affiliations:
 - name: School of Complex Adaptive Systems, Arizona State University
   index: 1
 - name: Mesoscale and Microscale Meteorology Laboratory, National Center for Atmospheric Research
   index: 2

date: 13 February 2021
bibliography: paper.bib

---

# Summary

The flow of information leading up to and during hazardous weather events plays a critical role in how people assess risk and make protective decisions. When such a weather event threatens, the storm, different types of information about the storm, and the multiple types of actors interacting with information and making decisions about the storm are interconnected components of a dynamic coupled human-natural system. These actors include forecasters, emergency managers, media broadcasters, and citizens, who collectively create, share, and interpret risk information and make decisions about how to respond. The complex, uncertain, and continually changing nature of hazardous weather forecasts can contribute to people underestimating their risk, overestimating their risk, or taking inappropriate or delayed protective actions. In order to help forecasters and public officials plan for hazardous weather threats and effectively advise citizens when they occur, models that integrate social decision making with the evolution of weather events and risk information can be used to enable controlled experiments of hazardous weather scenarios.  

# Statement of need

The **Communicating Hazard Information in the Modern Environment** (CHIME) agent-based model (ABM) is a Netlogo program that facilitates the analysis of information flow and protective decisions across space and time during hazardous weather events. CHIME ABM provides a platform for testing hypotheses about collective human responses to weather forecasts and information flow, using empirical data from historical hurricanes. The model uses real world geographical and hurricane data to set the boundaries of the simulation, and it uses historical hurricane forecast information from the National Hurricane Center to initiate forecast information flow to citizen agents in the model. The model package includes hurricane and forecast data for historical Hurricanes Wilma, Charley, Harvey, Michael and Irma; it is possible to extend the model further with the inclusion of additional storms. Agents in the model include citizens, forecasters, emergency managers, and broadcasters, and the model simulates and follows information flow among these agents. As the model progresses, hurricane forecast information is regularly updated (as in real-world weather forecasting) and sent to forecaster agents. Forecaster agents then release this new forecast information to emergency manager and broadcaster agents, who then release it to the population of citizen agents. As a simulation progresses, emergency manager agents also use this forecast information to decide whether to issue an evacuation order for nearby coastal areas. At multiple times during the simulation, each citizen combines information from the aforementioned sources, other citizens (i.e., information shared through personal connections), and personal observation. Based on their geographical location, interpretation of the risk posed by the impending storm, and risk tolerance, each citizen agent then decides whether to evacuate, take another protective action (e.g. boarding up windows), or change how frequently they update their interpretation of the storm and make a new decision. Once a weather event has finished, a record of the timing and type of actions taken by citizens is recorded so that researchers can make comparisons to other simulation scenarios or the actual actions taken by citizens during a real event.

The CHIME ABM and results of experiments carried out with the model have been described in previous scientific publications [@Morssetal:2017; @Wattsetal:2019]. The model advances our understanding of the roles that modern information flow plays in decision making during hazardous weather. Additionaly, CHIME ABM provides a foundation for investigation into future hurricane events, and it provides a template for models of human risk assessment of other types of temporally- and spatially-evolving hazardous events. 


# Acknowledgements
The work reported here was supported by National Science Foundation award AGS 1331490, the National Center for Atmospheric Research, and Arizona State University. The National Center for Atmospheric Research is also sponsored by the National Science Foundation. The authors would also like to acknowledge contributions from collaborators on the larger project, especially Joshua Watts, Heather Lazrus, Olga Wilhelmi, Christopher Davis, Kathryn Fossell, David Ahijevych, Chris Snyder, Leysia Palen, and Kenneth Anderson.


# References
