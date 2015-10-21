<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" xmlns:date="http://exslt.org/dates-and-times"
	exclude-result-prefixes="java">

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
	<!-- Bordure de tableau -->
	<xsl:attribute-set name="bordure">
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-size">8pt</xsl:attribute>
		<xsl:attribute name="padding-top">2pt</xsl:attribute>
	</xsl:attribute-set>


	<!-- template global -->
	<xsl:template match="informationRequest">
		<fo:table>
			<fo:table-column column-width="100%" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Information pr�alable �
							la consultation ou � la d�livrance d'extraits
							d'informations
							cadastrales
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Vous avez souhait�
							obtenir des informations cadastrales relatives �
							une propri�t�
							d�termin�e, � partir de sa localisation (adresse)
							ou de don
							identification cadastrale (n� de parcelle). Les
							informations vous
							seront remises, sous forme papier, par
							l'interm�diaire de l'agent
							municipal habilit� � cette fin. Pour
							pouvoir r�pondre � votre
							demande, nous vous prions de lire et
							compl�ter le pr�sent
							document.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Information sur le demandeur:
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table>
						<fo:table-column column-width="50%" />
						<fo:table-column column-width="50%" />
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Nom : <xsl:value-of select="userRequest/lastName" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Pr�nom : <xsl:value-of select="userRequest/firstName" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Adresse : <xsl:value-of select="userRequest/adress" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Code Postal : <xsl:value-of select="userRequest/codePostal" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Ville : <xsl:value-of select="userRequest/commune" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Objet de la demande (indiquez l'adresse ou la r�f�rence cadastrale de
							la propri�t� que vous souhaitez consulter)
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Conditions de communication des informations cadastrales:
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Si vous �tes propri�taire de la parcelle et que vous avez justifi� de cette qualit�, ou que vous avez d�sign� un mandataire qui pourra attester de cette qualit�, l'ensemble des donn�es vous concernant peuvent vous �tre d�livr�es.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							En tant que tiers demandeur, vous pouvez avoir communication des r�f�rences cadastrales et de l'adresse d'un bien, de son �valuation pour la d�termination de la taxe fonci�re (valeur locative), ainsi que des nom, pr�nom et adresse du ou des propri�taires. Vous ne pouvez pas avoir acc�s aux date et lieu de naissance du propri�taire, ni aux mentions relatives aux motifs d'exon�ration fiscale.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							Conditions de r�utilisation des informations cadastrales:
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							La r�utilisation des informations cadastrales est soumise, en l'�tat actuel de la l�gislation, au consentement de la personne concern�e (le propri�taire), ou � l'anonymisation pr�alable des informations par l'autorit� d�tentrice de ces donn�es, conform�ment � l'article 13 de la loi du 17 juillet 1978 modifi�e relative � l'acc�s aux documents administratifs et � la r�utilisation des informations publiques.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xsl:use-attribute-sets="bordure">
							En outre, tout traitement ult�rieur ou constitution d'un fichier comportant des donn�es � caract�re personnel est soumis aux dispositions de la loi du 6 janvier 1978 modifi�e relative � l'informatique, aux fichiers et aux libert�s
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table>
						<fo:table-column column-width="50%" />
						<fo:table-column column-width="50%" />
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Date :
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bordure">
									Signature
								</fo:block>
								<fo:block xsl:use-attribute-sets="bordure">
									Pr�c�d�e de la mention lu et approuv�
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
</xsl:stylesheet>