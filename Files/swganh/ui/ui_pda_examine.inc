		<Page
			comp.eq.visible='parent.comp.eq.visible'
			Location='271,202'
			MinimumSize='366,170'
			Name='examine'
			ScrollExtent='557,395'
			Size='557,395'
			UserMovable='true'
			UserResizable='true'
			Visible='false'
		>
			<Data
				buttonclose='bg.mmc.close'
				info='info'
				Name='CodeData'
				StartSize='366,213'
			/>
			<Button
				DragType='uicommand'
				IsDefaultButton='true'
				Location='9,23'
				Name='buttonInfo'
				oldDetailsVisible='false'
				oldDetailsVisibleTmp='false'
				OnPress='olddetailsVisibleTmp=parent.info.comp.details.visible
parent.info.comp.details.visible=olddetailsVisible
olddetailsVisible=olddetailsVisibleTmp
parent.info.comp.pack=t'
				PackLocation='nfn,nfn'
				PackSize='f,f'
				ScrollExtent='28,8'
				Size='28,8'
				Style='/Styles.New.buttons.pane_arrow.style'
			></Button>
			<Page
				Location='11,32'
				Name='info'
				PackSize='a,a'
				RStyleDefault='/Styles.New.whiteOutline.rs_default'
				ScrollExtent='536,347'
				Selectable='true'
				Size='536,347'
			>
				<Data
					content='comp.details.content'
					Label='bg.caption.text'
					Name='CodeData'
					textAttribs='comp.details.content.textAttribs'
					textDesc='comp.details.content.textDesc'
					viewer='comp.right.viewerpage.viewer'
				/>
				<Composite
					Name='comp'
					Orientation='Horizontal'
					PackSize='a,a'
					ScrollExtent='536,347'
					Selectable='true'
					Size='536,347'
					SpacingType='Fill'
				>
					<Page
						MaximumSize='220,16384'
						MinimumSize='220,0'
						Name='details'
						OnHide='parent.pack=t'
						OnShow='parent.pack=t'
						PackLocation='nfn,nfn'
						PackSize='f,a'
						RStyleDefault='rs'
						ScrollExtent='220,347'
						Size='220,347'
					>
						<Composite
							Location='4,7'
							MaximumSize='293,16384'
							Name='content'
							OnDisableEffector='/effectors.opacity.fast.fadeout'
							OnEnableEffector='/effectors.opacity.fast.fadefull'
							PackLocation='nfn,nfn'
							PackSize='a,a'
							ScrollExtent='197,336'
							Size='197,336'
							Spacing='10'
							SpacingType='Constant'
							UserDragScrollable='true'
						>
							<Text
								Font='bold_12'
								LocalText='xxx attrib 1:    info here
xxx attrib 2:    info here
xxx attrib 3:    info here
xxx attrib 4:    info here
xxx attrib 5:    info here
xxx attrib 6:    info here
xxx attrib 7:    info here
xxx attrib 8:    info here
'
								Margin='4,4,4,4'
								Name='textAttribs'
								PackSize='a,f'
								PalText='text1'
								RStyleDefault='/Styles.New.whitebox.rs_default'
								ScrollExtent='197,116'
								Size='197,116'
								TextColor='#96F4FC'
							>xxx attrib 1:    info here
xxx attrib 2:    info here
xxx attrib 3:    info here
xxx attrib 4:    info here
xxx attrib 5:    info here
xxx attrib 6:    info here
xxx attrib 7:    info here
xxx attrib 8:    info here
</Text>
							<Text
								Font='bold_12'
								LocalText='xxx Description goes into this field with all the other text ok you can stop now.'
								Location='0,126'
								Margin='4,4,4,4'
								Name='textDesc'
								PackLocation='nfn,fff'
								PackSize='a,f'
								PalText='text1'
								RStyleDefault='/Styles.New.whitebox.rs_default'
								ScrollExtent='197,44'
								Size='197,44'
								TextColor='#96F4FC'
							>xxx Description goes into this field with all the other text ok you can stop now.</Text>
						</Composite>
						<Scrollbar
							Control='content'
							Enabled='false'
							Location='203,5'
							Name='Scroll'
							Opacity='0.90'
							PackLocation='fff,nfn'
							PackSize='f,a'
							ScrollExtent='11,337'
							Size='11,337'
							Style='/Styles.scrollbar.default.vHud4.style'
						>
						</Scrollbar>
						<Page
							BackgroundTint='#1CFFFF'
							GetsInput='false'
							Name='outline'
							PackLocation='nfn,nfn'
							PackSize='a,a'
							PalBgTint='line1'
							ScrollExtent='218,347'
							Selectable='true'
							Size='218,347'
						>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.80'
								BackgroundTint='#1CFFFF'
								Name='outline'
								PackLocation='nfn,nfn'
								PackSize='a,a'
								PalBgTint='line1'
								RStyleDefault='/Styles.New.whiteOutline_palW.rs_default'
								ScrollExtent='218,347'
								Size='218,347'
							/>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.30'
								BackgroundTint='#00D6FB'
								Location='4,6'
								Name='box'
								PackLocation='nfn,nfn'
								PackSize='a,a'
								PalBgTint='back1'
								RStyleDefault='/Styles.New.whitebox_palW.rs_default'
								ScrollExtent='198,337'
								Size='198,337'
							/>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.60'
								BackgroundTint='#00D6FB'
								Name='inFrame'
								PackLocation='nfn,nfn'
								PackSize='a,a'
								PalBgTint='back1'
								RStyleDefault='/Styles.New.fatFrameInside_palW.rs_default'
								ScrollExtent='216,347'
								Size='216,347'
							/>
						</Page>
					</Page>
					<Page
						Location='220,0'
						MinimumSize='148,0'
						Name='right'
						PackLocation='nfn,nfn'
						PackSize='f,a'
						RStyleDefault='rs_default'
						ScrollExtent='316,347'
						Size='316,347'
					>
						<Page
							Name='ViewerPage'
							PackSize='a,a'
							RStyleDefault='/Styles.New.whiteOutline.rs_default'
							ScrollExtent='316,347'
							Size='316,347'
						>
							<CuiWidget3dObjectListViewer
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.60'
								BackgroundTint='#00D6FB'
								CameraPitch='0.2'
								Dragable='true'
								dragpitchok='true'
								Location='4,4'
								Name='Viewer'
								PackLocation='fff,nfn'
								PackSize='a,a'
								PalBgTint='back1'
								RStyleDefault='/Styles.New.viewer.rs_default'
								ScrollExtent='309,339'
								Size='309,339'
							/>
							<Image
								Color='#00D6FB'
								Location='93,106'
								Name='New Image'
								PackLocation='cfc,cfc'
								PackSize='f,f'
								PalColor='back1'
								ScrollExtent='127,127'
								Size='127,127'
								SourceRect='266,0,512,252'
								SourceResource='ui_viewer_back'
							/>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.50'
								BackgroundTint='#00D6FB'
								Location='8,12'
								Name='box'
								PackLocation='nfn,nfn'
								PackSize='a,a'
								PalBgTint='back1'
								RStyleDefault='/Styles.New.pill_lrg.rs_default'
								ScrollExtent='301,314'
								Size='301,314'
							/>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.50'
								BackgroundTint='#00D6FB'
								Name='bg_viewer'
								PackLocation='nfn,nfn'
								PackSize='a,a'
								PalBgTint='back1'
								RStyleDefault='/Styles.New.fatFrameInside.rs_default'
								ScrollExtent='316,347'
								Size='316,347'
							>
								<Page
									BackgroundColor='#FFFFFF'
									BackgroundOpacity='0.60'
									BackgroundTint='#03546B'
									Location='3,4'
									Name='box'
									PackLocation='nfn,nfn'
									PackSize='a,a'
									PalBgTint='back3'
									RStyleDefault='/Styles.New.whitebox_palW.rs_default'
									ScrollExtent='309,338'
									Size='309,338'
									Visible='false'
								/>
								<Page
									BackgroundColor='#FFFFFF'
									BackgroundOpacity='0.80'
									BackgroundTint='#1CFFFF'
									Name='outline'
									PackLocation='nfn,nfn'
									PackSize='a,a'
									PalBgTint='line1'
									RStyleDefault='/Styles.New.whiteOutline.rs_default'
									ScrollExtent='316,347'
									Size='316,347'
								/>
							</Page>
						</Page>
					</Page>
				</Composite>
			</Page>
			<Page
				Name='bg'
				PackLocation='nfn,nfn'
				PackSize='a,a'
				ScrollExtent='557,395'
				Size='557,395'
			>
				<Page
					Location='546,8'
					Name='mmc'
					PackLocation='fff,nfn'
					PackSize='f,f'
					RStyleDefault='/Styles.New.thin_mmc.rs_default'
					ScrollExtent='12,10'
					Size='12,10'
				>
					<Button
						BackgroundColor='#FFFFFF'
						BackgroundOpacity='0.80'
						IsCancelButton='true'
						Location='-3,-3'
						Name='close'
						PackLocation='fff,cfc'
						PackSize='f,f'
						ScrollExtent='16,16'
						Size='16,16'
						Style='/Styles.Frame.buttonClose.style'
					></Button>
				</Page>
				<Page
					MinimumSize='0,19'
					Name='caption'
					PackLocation='nfn,nfn'
					PackSize='a,f'
					ScrollExtent='420,19'
					Size='420,19'
				>
					<Text
						Enabled='false'
						Font='bold_13'
						LocalText='XXX ITEM NAME'
						Margin='6,-2,0,0'
						MaxLines='1'
						MinimumSize='0,19'
						Name='text'
						PackSize='a,f'
						PalText='titletext'
						ScrollExtent='420,19'
						Size='420,19'
						TextAlignmentVertical='Center'
						TextCapital='true'
						TextColor='#00354F'
					>xxx item name</Text>
				</Page>
				<Page
					BackgroundTint='#00D6FB'
					GetsInput='false'
					Location='1,0'
					Name='frame'
					PackLocation='nfn,nfn'
					PackSize='a,a'
					PalBgTint='baselight'
					RStyleDefault='/Styles.New.thin_in.rs_default'
					ScrollExtent='556,395'
					Selectable='true'
					Size='556,395'
				>
					<Page
						BackgroundColor='#FFFFFF'
						GetsInput='false'
						Location='1,0'
						Name='lines'
						PackSize='a,a'
						RStyleDefault='/Styles.space.boxes.generic4.rs_default'
						ScrollExtent='556,395'
						Size='556,395'
					>
						<Page
							BackgroundColor='#FFFFFF'
							GetsInput='false'
							Location='0,373'
							Name='outlineBL'
							OpacityRelativeMin='0.80'
							PackLocation='nfn,fff'
							PackSize='p,f'
							ScrollExtent='437,22'
							Size='437,22'
						>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='1.00'
								BackgroundTint='#1CFFFF'
								GetsInput='false'
								Location='0,13'
								Name='outline1'
								OpacityRelativeMin='0.80'
								PackSize='a,a'
								PalBgTint='line1'
								RStyleDefault='/Styles.space.boxes.boxlinebottomLeft2.rs_default'
								ScrollExtent='437,9'
								Size='437,9'
							/>
						</Page>
						<Page
							BackgroundColor='#FFFFFF'
							GetsInput='false'
							Location='153,373'
							Name='outlineBR'
							OpacityRelativeMin='0.80'
							PackLocation='fff,fff'
							PackSize='p,f'
							RStyleDefault='/Styles.space.boxes.boxlineTopLeft.rs_default'
							ScrollExtent='403,22'
							Size='403,22'
						>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='1.00'
								BackgroundTint='#1CFFFF'
								GetsInput='false'
								Location='0,13'
								Name='outline1'
								OpacityRelativeMin='0.80'
								PackSize='a,a'
								PalBgTint='line1'
								RStyleDefault='/Styles.space.boxes.boxlinebottomRight2.rs_default'
								ScrollExtent='403,9'
								Size='403,9'
							/>
						</Page>
						<Page
							BackgroundColor='#FFFFFF'
							GetsInput='false'
							Location='153,0'
							Name='outlineTR'
							OpacityRelativeMin='0.80'
							PackLocation='fff,nfn'
							PackSize='p,f'
							ScrollExtent='403,22'
							Size='403,22'
						>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='1.00'
								BackgroundTint='#1CFFFF'
								GetsInput='false'
								Name='outline1'
								OpacityRelativeMin='0.80'
								PackSize='a,a'
								PalBgTint='line1'
								RStyleDefault='/Styles.space.boxes.boxlineTopRight2.rs_default'
								ScrollExtent='403,9'
								Size='403,9'
							/>
						</Page>
						<Page
							BackgroundColor='#FFFFFF'
							GetsInput='false'
							Name='outlineTL'
							OpacityRelativeMin='0.80'
							PackLocation='nfn,nfn'
							PackSize='p,f'
							RStyleDefault='/Styles.space.boxes.boxlineTopLeft.rs_default'
							ScrollExtent='437,22'
							Size='437,22'
						>
							<Page
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='1.00'
								BackgroundTint='#1CFFFF'
								GetsInput='false'
								Name='outline1'
								OpacityRelativeMin='0.80'
								PackSize='a,a'
								PalBgTint='line1'
								RStyleDefault='/Styles.space.boxes.boxlineTopLeft2.rs_default'
								ScrollExtent='437,9'
								Size='437,9'
							/>
						</Page>
					</Page>
					<Page
						BackgroundOpacity='1.00'
						Location='-1,0'
						Name='top'
						PackLocation='nfn,nfn'
						PackSize='a,f'
						RStyleDefault='/Styles.New.main_TR.rs_default'
						ScrollExtent='557,29'
						Size='557,29'
					/>
					<Page
						BackgroundOpacity='1.00'
						Location='0,372'
						Name='bottom'
						PackLocation='nfn,fff'
						PackSize='a,f'
						RStyleDefault='/Styles.New.main_BR.rs_default'
						ScrollExtent='556,23'
						Size='556,23'
					/>
				</Page>
				<Page
					BackgroundOpacity='1.00'
					BackgroundTint='#00D6FB'
					GetsInput='false'
					Location='0,5'
					Name='back'
					PackLocation='nfn,nfn'
					PackSize='a,a'
					PalBgTint='back1'
					RStyleDefault='/Styles.New.thin_in.rs_default'
					ScrollExtent='557,387'
					Selectable='true'
					Size='557,387'
				/>
				<Page
					BackgroundOpacity='0.80'
					BackgroundTint='#00D6FB'
					GetsInput='false'
					Name='back'
					PackLocation='nfn,nfn'
					PackSize='a,a'
					PalBgTint='back1'
					RStyleDefault='/Styles.space.spaceglow.rs_default'
					ScrollExtent='557,395'
					Selectable='true'
					Size='557,395'
				/>
			</Page>
		</Page>
