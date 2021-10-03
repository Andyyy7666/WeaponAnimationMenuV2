------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

version "1.0"
title "Weapon Animation Menu V2"
description "NUI Weapon Animation Menu that will save."
author "Andyyy#7666"

fx_version "cerulean"
game "gta5"

ui_page "html/index.html"

files {
	"html/index.html",
	"html/js/jquery-3.6.0.min.js",
	"html/img/Aim-Default.png",
	"html/img/Aim-Gangster.png",
	"html/img/Aim-HillBilly.png",
	"html/img/Holster-Back.png",
	"html/img/Holster-Cop.png",
	"html/img/Holster-Default.png",
	"html/img/Holster-Front.png",
	"html/img/Holster-FrontAgressive.png",
	"html/img/Holster-Leg.png",
	"html/js/listener.js",
	"html/style.css",
}

shared_script "config.lua"
server_script "server.lua"
client_script "client.lua"