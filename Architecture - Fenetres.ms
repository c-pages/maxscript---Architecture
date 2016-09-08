
rollout fenetreArchitecture "Architecture" width:814  height:60 	-- height:350 
(
	---- Membres ---------------------------------------------------
	local ui 						= #()		---- la liste des boutons de l'interface
	local ui_verti 				= #()		---- la groupe de boutons de l'interface
	local ui_horiz 				= #()		---- la groupe de boutons de l'interface
	local ui_modeler_verti 	= #()		---- la groupe de boutons de l'interface
	local ui_modeler_horiz 	= #()		---- la groupe de boutons de l'interface
	local ui_toiture 			= #()		---- la groupe de boutons de l'interface
	local ui_menuiseries 	= #()		---- la groupe de boutons de l'interface
	local ui_plateformes 	= #()		---- la groupe de boutons de l'interface
	local prt									---- pointeur vers le struct principal
	
	
	---- UI ---------------------------------------------------
	
	GroupBox 'grp_modeler' "Modeler" pos:[6,2] width:321 height:53 align:#left
	button 'btn_divParDeux' "Diviser /2" pos:[11,18] width:60 height:16 align:#left
	button 'btn_divParTrois' "Diviser /3" pos:[11,33] width:60 height:16 align:#left
	checkbutton 'btn_div2Sens' "v" pos:[70,18] width:16 height:16 align:#left
	checkbutton 'btn_div3Sens' "v" pos:[70,33] width:16 height:16 align:#left
	
	button 'btn_extruder' "Extruder" pos:[85,18] width:60 height:16 align:#left
	button 'btn_incruster' "Incruster" pos:[85,33] width:60 height:16 align:#left
	button 'btn_souder' "Souder" pos:[143,18] width:60 height:16 align:#left
	button 'btn_etage' "Etage" pos:[202,18] width:60 height:31 align:#left
	button 'btn_baies' "Bais" pos:[261,18] width:60 height:31 align:#left
	
	GroupBox 'grp_toiture' "Toiture" pos:[526,2] width:130 height:53 align:#left
	button 'btn_accrotere' "Accrotère" pos:[531,18] width:60 height:31 align:#left
	button 'btn_pansDeux' "2 pans" pos:[590,18] width:60 height:31 align:#left
	
	GroupBox 'grp_menuiserie' "Menuiserie" pos:[331,2] width:191 height:53 align:#left
	button 'btn_fixe' "Fixe" pos:[336,18] width:60 height:31 align:#left
	button 'btn_porte' "Portes" pos:[395,18] width:60 height:31 align:#left
	button 'btn_ventDeux' "Ouvrant 2 venteaux" pos:[454,18] width:60 height:31 align:#left
	
	GroupBox 'grp_plateformes' "Plateformes" pos:[660,2] width:130 height:53 align:#left
	button 'btn_balcon' "Balcon" pos:[665,18] width:60 height:31 align:#left
	button 'btn_loggia' "Loggia" pos:[724,18] width:60 height:31 enabled:true align:#left
	
	button 'btn_test' "tst" pos:[794,24] width:16 height:16 align:#left
	checkbutton 'btn_details' "+" pos:[794,39] width:16 height:16 align:#left	

	GroupBox 'grp_params' "Paramêtres " pos:[5,67] width:805 height:279 align:#left
	subRollout 'sousRoll' "Paramêtres" pos:[12,82] width:786 height:236 align:#left
	button 'btn_defauts' "Défauts" pos:[11,322] width:86 height:18 align:#left
	
	button 'btn_preparer' "Préparer\nle noeud" pos:[0,0] width:814 height:60 align:#left	--	border:false 
	
	
	
	---- Fonctions --------------------------------------------
	fn actualiserUI = (
		
		local enable_groupes 			= false	
		
		if prt.modele.estPret() then (
			
			for btn in ui do btn.visible = true
			btn_preparer.visible 			= false			
			btn_preparer.enabled 		= false
			
			if subobjectLevel == 4 then (
				if ( prt.faces.selection() as array ).count > 0 then (	
					if prt.faces.sontVertical () do (
						for btn in ui do 
							if findItem ui_verti btn == 0 	
								then  	btn.enabled = false
								else  	btn.enabled = true
					)
					if prt.faces.sontZenithal () do (
						for btn in ui do 
							if findItem ui_horiz btn == 0 
								then  	btn.enabled = false
								else  	btn.enabled = true
					)
				) else (
					for btn in ui do btn.enabled = false
				)
			)  else (
				for btn in ui do btn.enabled = false
			)
			
		) else (
			for btn in ui do (
				btn.enabled 	= false
				btn.visible 		= false
			)
			if ( selection as array ).count == 0 then (
				btn_preparer.text = "Sélectionner le node à Architecturer ..."
				btn_preparer.enabled	= false
			) else if ( selection as array ).count != 1 then (
				btn_preparer.text = "Sélectionner un seul node pour pouvoir Architecturer ..."
				btn_preparer.enabled	= false
			) else (
				
				btn_preparer.text = "Préparer le node sélectionné pour commencer à l'Architecturer"
				btn_preparer.enabled	= true
			)
			btn_preparer.visible 			= true	
		)			-- fin  ( if subobjectLevel != 4 ) 
		
		
		-- les groupes --
		enable_groupes 					= prt.modele.estPret()
		ui_modeler_verti[1].enabled 	= enable_groupes
		ui_toiture[1].enabled 			= enable_groupes
		ui_menuiseries[1].enabled 		= enable_groupes
		ui_plateformes[1].enabled 		= enable_groupes
		
		-- les checkBtn horiz ou verti --
		case btn_div2Sens.state of (
			true:	btn_div2Sens.text = "h"
			false:	btn_div2Sens.text = "v"
		)
		case btn_div3Sens.state of (
			true:	btn_div3Sens.text = "h"
			false:	btn_div3Sens.text = "v"
		)
		
	)	
	fn initialiser = (
		ui_verti = #(
					grp_modeler,
					btn_divParDeux,
					btn_divParTrois,
					btn_div2Sens,
					btn_div3Sens,
					btn_extruder,
					btn_incruster,
					btn_souder,
					btn_baies,
					btn_fixe,
					btn_porte,
					btn_ventDeux,
					btn_balcon,
					btn_loggia
		)
		ui_horiz = #(
					btn_extruder,
					btn_incruster,
					btn_etage,
					btn_accrotere,
					btn_pansDeux
		)
		ui_modeler_verti = #(
					grp_modeler,
					btn_divParDeux,
					btn_divParTrois,
					btn_div2Sens,
					btn_div3Sens,
					btn_extruder,
					btn_incruster,
					btn_souder,
					btn_baies
		)
		ui_modeler_horiz = #(
					btn_extruder,
					btn_incruster,
					btn_etage
		)
		ui_toiture = #(
					grp_toiture,
					btn_accrotere,
					btn_pansDeux
		)
		ui_menuiseries = #(
					grp_menuiserie,
					btn_fixe,
					btn_porte,
					btn_ventDeux
		)
		ui_plateformes = #(
					grp_plateformes,
					btn_balcon,
					btn_loggia
		)
		ui = #( 	
					btn_preparer,
					
					grp_modeler,
					btn_divParDeux,
					btn_divParTrois,
					btn_div2Sens,
					btn_div3Sens,
					btn_extruder,
					btn_incruster,
					btn_souder,
					btn_etage,
					btn_baies,
					
					grp_toiture,
					btn_accrotere,
					btn_pansDeux,
					
					grp_menuiserie,
					btn_fixe,
					btn_porte,
					btn_ventDeux,
					
					grp_plateformes,
					btn_balcon,
					btn_loggia,
					
					grp_params,
					sousRoll,
					btn_defauts,
					
					btn_test,
					btn_details
		)
	)
	
	
	
	
	
	---- Evenements ------------------------------------------
	on fenetreArchitecture close do
		prt.fermerFenetre ()
	on fenetreArchitecture open do
		initialiser ()
	on fenetreArchitecture moved pos 	do
		prt.bougerFenetre pos
	
	on btn_preparer pressed do (
		prt.modele.preparer ()
		actualiserUI()
	)
	
	on btn_divParDeux pressed do (
	)
	on btn_divParTrois pressed do
		()
	on btn_div2Sens changed state do actualiserUI ()
	on btn_div3Sens changed state do actualiserUI ()
	on btn_extruder pressed do
		()
	on btn_incruster pressed do
		()
	on btn_souder pressed do
		()
	on btn_etage pressed do
		()
	on btn_baies pressed do
		()
	on btn_accrotere pressed do
		()
	on btn_pansDeux pressed do
		()
	on btn_fixe pressed do
		()
	on btn_porte pressed do
		()
	on btn_ventDeux pressed do
		()
	on btn_balcon pressed do
		()
	on btn_loggia pressed do
		()
	on btn_details changed state do
		()
	on btn_test pressed do
		()
	on btn_defauts pressed do
		()
)
