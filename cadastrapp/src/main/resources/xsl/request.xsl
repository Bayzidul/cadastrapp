<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" xmlns:date="http://exslt.org/dates-and-times"
	exclude-result-prefixes="java" xmlns:svg="http://www.w3.org/2000/svg">

	<!-- Page layout information -->
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<fo:layout-master-set>
				<fo:simple-page-master master-name="portrait"
					page-height="29.7cm" page-width="21cm" font-family="sans-serif"
					margin-top="0.5cm" margin-bottom="0.5cm" margin-left="0.5cm"
					margin-right="0.5cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="portrait">
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates select="informationRequest" />
				</fo:flow>
			</fo:page-sequence>

		</fo:root>
	</xsl:template>

	<!-- Definition des styles -->

	<!-- Style Titre -->
	<xsl:attribute-set name="titre">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="padding-top">5pt</xsl:attribute>
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Style Titre -->
	<xsl:attribute-set name="soustitre">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="padding-top">5pt</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- texte normal -->
	<xsl:attribute-set name="text">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-size">8pt</xsl:attribute>
		<xsl:attribute name="padding-top">10pt</xsl:attribute>
	</xsl:attribute-set>

	<!-- texte normal -->
	<xsl:attribute-set name="text-bold">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
		<xsl:attribute name="padding-top">10pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Bordure de tableau -->
	<xsl:attribute-set name="bordure">
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-size">8pt</xsl:attribute>
		<xsl:attribute name="padding-top">2pt</xsl:attribute>
	</xsl:attribute-set>



	<!-- Global template with the two same pages -->
	<xsl:template match="informationRequest">
		<xsl:call-template name="globalpage" />
		<xsl:call-template name="globalpage" />
	</xsl:template>

	<xsl:template name="checkbox">
		<fo:block>
			<fo:instream-foreign-object>
				<svg:svg width="5" height="5">
					<svg:rect width="5" height="5" style="stroke-width:0.5;stroke:rgb(0,0,0)" />
				</svg:svg>
			</fo:instream-foreign-object>
		</fo:block>
	</xsl:template>

	<xsl:template name="informationDemandeur">
		<fo:block xsl:use-attribute-sets="bordure">
			<fo:table>
				<fo:table-column column-width="50%" />
				<fo:table-column column-width="50%" />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								Nom :
								<xsl:value-of select="userRequest/@lastName" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								Pr�nom :
								<xsl:value-of select="userRequest/@firstName" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								Adresse :
								<xsl:value-of select="userRequest/@adress" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								Code Postal :
								<xsl:value-of select="userRequest/@codepostal" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								Ville :
								<xsl:value-of select="userRequest/@commune" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template name="numeroDeDemande">
		<fo:block xsl:use-attribute-sets="text">
			Demande num�ro :
			<xsl:value-of select="@requestId" />
		</fo:block>
	</xsl:template>

	<xsl:template name="informationDemande">

		<fo:block xsl:use-attribute-sets="bordure">
			Compte commnual :
			<xsl:value-of select="@comptecommunal" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="bordure">
			Identifiant(s) de parcelle(s) :
			<xsl:for-each select="parcelles/parcelle">
				<xsl:value-of select="@parcelle" />
			</xsl:for-each>
		</fo:block>
	</xsl:template>

	<xsl:template name="signatureDemandeur">
		<fo:table>
			<fo:table-column column-width="50%" />
			<fo:table-column column-width="50%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="text-bold">
							Date :
							<xsl:value-of select="@requestDate" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="text-bold">
							Signature :
						</fo:block>
						<fo:block xsl:use-attribute-sets="text">
							Pr�c�d�e de la mention
							"lu et approuv�""
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<xsl:template name="typedinformation">
		<fo:block xsl:use-attribute-sets="bordure">
			<fo:block xsl:use-attribute-sets="soustitre">
				<fo:inline font-style="italic" font-family="serif"
					text-decoration="underline">
					Informations transmises :
				</fo:inline>
			</fo:block>
			<fo:table>
				<fo:table-column column-width="50%" />
				<fo:table-column column-width="50%" />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
						<xsl:call-template name="checkbox" />
							<fo:block xsl:use-attribute-sets="text">r�f�rences cadastrales</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								nom et pr�nom du ou des
								propri�taire(s)
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">superficie de la
								parcelle</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">adresse du ou des
								propri�taire(s)</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">adresse du bien</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								date et lieu de
								naissance du ou des propri�taire(s)</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">valeur locative</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">relev� de propri�t�
								complet</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="text">
								liste des parcelles
								contigu�s avec les r�f�rences
								cadastrales, les surfaces et les
								nom, pr�nom adresse du ou
								des propri�taire(s)</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="soustitre">
								<fo:inline font-style="italic" font-family="serif"
									text-decoration="underline" padding-bottom="15mm">
									Autres :
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>

	</xsl:template>

	<xsl:template name="globalpage">
		<fo:block xsl:use-attribute-sets="titre" page-break-before="always">
			Information pr�alable � la consultation ou � la d�livrance d'extraits
			d'informations cadastrales
		</fo:block>

		<fo:block xsl:use-attribute-sets="text">
			Vous avez souhait�
			obtenir
			des informations cadastrales relatives �
			une propri�t�
			d�termin�e, �
			partir de son identification cadastrale
			(n� de parcelle) ou du compte
			commnunal de son propri�taires.
			Les informations vous
			seront remises,
			sous forme
			papier, par
			l'interm�diaire de l'agent
			municipal habilit� �
			cette fin.
			Pour
			pouvoir r�pondre � votre
			demande, nous vous relire et
			compl�ter le pr�sent
			document.
		</fo:block>

		<fo:block xsl:use-attribute-sets="soustitre">
			<fo:inline font-style="italic" font-family="serif"
				text-decoration="underline">
				Information sur le
				demandeur:
			</fo:inline>
		</fo:block>

		<xsl:call-template name="informationDemandeur" />

		<fo:block xsl:use-attribute-sets="soustitre">
			<fo:inline font-style="italic" font-family="serif"
				text-decoration="underline">
				Objet de la demande :
			</fo:inline>
		</fo:block>

		<xsl:call-template name="informationDemande" />

		<fo:block xsl:use-attribute-sets="soustitre">
			<fo:inline font-style="italic" font-family="serif"
				text-decoration="underline">
				Conditions de communication
				des informations
				cadastrales :
			</fo:inline>
		</fo:block>

		<fo:block xsl:use-attribute-sets="text">
			Si vous �tes propri�taire de
			la parcelle et que vous avez justifi� de
			cette qualit�, ou que vous
			avez d�sign� un mandataire qui pourra
			attester de cette qualit�,
			l'ensemble des donn�es vous concernant
			peuvent vous �tre d�livr�es.
		</fo:block>

		<fo:block xsl:use-attribute-sets="text">
			En tant que tiers demandeur,
			vous pouvez avoir communication des
			r�f�rences cadastrales et de
			l'adresse d'un bien, de son �valuation
			pour la d�termination de la
			taxe fonci�re (valeur locative), ainsi
			que des nom, pr�nom et adresse
			du ou des propri�taires. Vous ne
			pouvez pas avoir acc�s aux date et
			lieu de naissance du propri�taire,
			ni aux mentions relatives aux
			motifs d'exon�ration fiscale.
		</fo:block>

		<fo:block xsl:use-attribute-sets="soustitre">
			<fo:inline font-style="italic" font-family="serif"
				text-decoration="underline">
				Conditions de r�utilisation
				des informations
				cadastrales :
			</fo:inline>
		</fo:block>

		<fo:block xsl:use-attribute-sets="text">
			La r�utilisation des
			informations cadastrales est soumise, en l'�tat
			actuel de la
			l�gislation, au consentement de la personne concern�e
			(le
			propri�taire), ou � l'anonymisation pr�alable des informations
			par
			l'autorit� d�tentrice de ces donn�es, conform�ment � l'article 13
			de
			la loi du 17 juillet 1978 modifi�e relative � l'acc�s aux
			documents
			administratifs et � la r�utilisation des informations
			publiques.
		</fo:block>

		<fo:block xsl:use-attribute-sets="text">
			En outre, tout traitement
			ult�rieur ou constitution d'un fichier
			comportant des donn�es �
			caract�re personnel est soumis aux
			dispositions de la loi du 6 janvier
			1978 modifi�e relative �
			l'informatique, aux fichiers et aux libert�s
		</fo:block>

		<xsl:call-template name="typedinformation" />

		<xsl:call-template name="signatureDemandeur" />
	</xsl:template>

</xsl:stylesheet>