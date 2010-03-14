		<Page
			BackgroundColor='#22FF22'
			buttons.enabled='true'
			collapse.visible='false'
			corner_TL.enabled='true'
			DragAccepts='Command'
			Location='176,623'
			MinimumSize='296,112'
			mmc.enabled='true'
			Name='ChatWindow'
			OnDisable='collapsing.floater.enabled=falsebuttons.enabled=falsemmc.enabled=falsecorner_TL.enabled=false'
			OnDisableEffector='/effectors.fadethreequarter'
			OnEnable='collapsing.floater.enabled=truebuttons.enabled=truemmc.enabled=truecorner_TL.enabled=true'
			OnEnableEffector='/Effectors.Fadefull'
			output.enabled='true'
			PackLocation='cfc,fff'
			PackSize='p,p'
			ScrollExtent='523,145'
			Size='523,145'
			TextOpacityRelativeApply='true'
			TextOpacityRelativeMin='0.80'
			UserMovable='true'
			UserResizable='true'
		>
			<Data
				buttonclose='collapsing.mmc.metal.inner.close'
				buttoncollapse='persistent.buttons.collapse'
				buttonexpand='persistent.buttons.expand'
				collapsingpage='collapsing'
				iconblink='/styles.icon.misc.blink'
				iconnoblink='/styles.icon.misc.no_blink'
				input='persistent.body.input'
				Name='CodeData'
				output='collapsing.output.body.text'
				persistentpage='persistent'
				StickyVisible='true'
				tabs='collapsing.tabs'
				textchannel='persistent.body.textchannel'
			/>
			<Page
				AbsorbsInput='false'
				DropToParent='true'
				Location='0,91'
				Name='persistent'
				PackLocation='nfn,fff'
				PackSize='a,f'
				RStyleDefault='/Styles.window.chat.persistent.bg.rs_default'
				ScrollExtent='523,54'
				Size='523,54'
			>
				<Page
					AbsorbsInput='false'
					Location='8,0'
					Name='buttons'
					OnDisableEffector='/effectors.fadeout'
					OnEnableEffector='/effectors.fadefull'
					PackLocation='nfn,fff'
					PackSize='f,f'
					ScrollExtent='14,14'
					Size='14,14'
				>
					<Button
						BackgroundColor='#FFFFFF'
						BackgroundOpacity='0.00'
						cmdname='CMD_uiChatCollapse'
						Dragable='true'
						DragType='command'
						Icon='/Styles.Icon.Misc.collapse_2'
						IconAlignment='Center'
						IconMargin='0,0,0,0'
						IconStretch='true'
						Name='collapse'
						OnPress='parent.expand.visible=truevisible=false'
						PackSize='a,a'
						RStyleDefault='rs_default'
						ScrollExtent='14,14'
						Size='14,14'
						Style='style'
						TextColor='#000000'
					></Button>
					<Button
						BackgroundOpacity='0.00'
						cmdname='CMD_uiChatCollapse'
						Dragable='true'
						DragType='command'
						Icon='/Styles.Icon.Misc.collapse'
						IconAlignment='Center'
						IconMargin='0,0,0,0'
						IconShrink='true'
						IconStretch='true'
						Name='expand'
						OnPress='parent.collapse.visible=truevisible=false'
						PackSize='a,a'
						ScrollExtent='14,14'
						Size='14,14'
						Style='style'
						TextColor='#000000'
						Visible='false'
					></Button>
				</Page>
				<Page
					BackgroundOpacity='1.00'
					GetsInput='false'
					Location='1,16'
					Name='corner_BL'
					OpacityRelativeMin='0.50'
					PackLocation='nfn,fff'
					PackSize='f,f'
					RStyleDefault='/Styles.New.corner_chatBL.rs_default'
					ScrollExtent='24,37'
					Size='24,37'
				/>
				<Page
					BackgroundOpacity='1.00'
					GetsInput='false'
					Location='487,17'
					Name='corner_BR'
					OpacityRelativeMin='0.50'
					PackLocation='fff,fff'
					PackSize='p,f'
					RStyleDefault='/Styles.New.corner_chatBR.rs_default'
					ScrollExtent='36,37'
					Size='36,37'
				/>
				<Page
					BackgroundOpacity='1.00'
					BackgroundTint='#00D6FB'
					DropToParent='true'
					Location='11,12'
					Name='body'
					PackSize='a'
					PalBgTint='back1'
					RStyleDefault='/Styles.New.chat.small.rs_default'
					ScrollExtent='502,39'
					Size='502,39'
				>
					<Text
						BackgroundColor='#FFFFFF'
						DropToParent='true'
						Font='bold_12'
						LocalText='CHANNEL'
						Location='0,3'
						MaxLines='1'
						Name='textChannel'
						PackSize='f,a'
						PalText='header'
						ScrollExtent='70,32'
						Size='70,32'
						TextAlignment='Center'
						TextAlignmentVertical='Center'
						TextColor='#97FFFF'
					>CHANNEL</Text>
					<Textbox
						BackgroundOpacity='0.70'
						CuiIoWinNoArrow='true'
						DropToParent='true'
						IME='true'
						Location='72,7'
						Name='Input'
						OpacityRelativeMin='0.50'
						PackSize='a,a'
						RStyleDefault='/Styles.window.mfd.mfd3.rs_default'
						ScrollExtent='424,28'
						Size='424,28'
						Style='/Styles.textbox.chat.Style_bold'
					>sdfsdfsdfsdfs</Textbox>
				</Page>
			</Page>
			<Page
				DropToParent='true'
				floater.enabled='true'
				MinimumSize='256,77'
				Name='collapsing'
				PackSize='a,a'
				ScrollExtent='523,105'
				Size='523,105'
			>
				<Page
					BackgroundOpacity='1.00'
					GetsInput='false'
					Location='1,10'
					Name='corner_TL'
					OnDisableEffector='/effectors.opacity.slow.fadehalf'
					OnEnableEffector='/effectors.opacity.fast.fadefull'
					OpacityRelativeMin='0.50'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					RStyleDefault='/Styles.New.corner_chatTL.rs_default'
					ScrollExtent='40,41'
					Size='40,41'
				/>
				<Page
					AbsorbsInput='false'
					DropToParent='true'
					Location='475,10'
					Name='mmc'
					OpacityRelativeMin='0.50'
					PackLocation='fff,nfn'
					PackSize='f,f'
					ScrollExtent='48,45'
					Size='48,45'
				>
					<Page
						AbsorbsInput='false'
						BackgroundOpacity='1.00'
						DropToParent='true'
						Location='9,0'
						Name='metal'
						PackLocation='fff,nfn'
						PackSize='f,f'
						RStyleDefault='/Styles.New.corner_chatTR.rs_default'
						ScrollExtent='39,43'
						Size='39,43'
					>
						<Page
							AbsorbsInput='false'
							DropToParent='true'
							Location='12,4'
							Name='inner'
							OnDisableEffector='/effectors.opacity.slow.fadehalf'
							OnEnableEffector='/effectors.opacity.fast.fadefull'
							PackLocation='fff,nfn'
							PackSize='f,f'
							RStyleDefault='/Styles.New.thin_mmc.rs_default'
							ScrollExtent='12,12'
							Size='12,12'
						>
							<Button
								BackgroundColor='#FFFFFF'
								BackgroundOpacity='0.80'
								DragType='uicommand'
								Name='close'
								PackLocation='fff,cfc'
								PackSize='a,a'
								ScrollExtent='13,13'
								Size='13,13'
								Style='/Styles.Frame.buttonCloseDark.style'
							></Button>
						</Page>
					</Page>
				</Page>
				<DataSource
					Name='TabData'
					Size='128,64'
				>
					<Data
						ContextCapable='true'
						DragType='chatwindowtab'
						Name='Spatial'
						Size='128,64'
						Target='output.body.text'
					/>
					<Data
						ContextCapable='PLANET'
						DragType='chatWindowTab'
						Name='Planet'
						Size='128,64'
						Target='output.body.text'
					/>
					<Data
						ContextCapable='true'
						DragType='chatWindowTab'
						Name='Combat'
						Size='128,64'
						Target='output.body.text'
					/>
				</DataSource>
				<TabbedPane
					ActiveTab='0'
					ContextCapable='true'
					DataSource='TabData'
					DragAccepts='command'
					DropToParent='true'
					Location='44,0'
					MinimumScrollExtent='154,0'
					Name='tabs'
					OpacityRelativeMin='0.50'
					PackSize='a,f'
					ScrollExtent='410,15'
					Size='410,15'
					Style='/Styles.New.tabs.hud.style'
				>
				</TabbedPane>
				<Scrollbar
					Control='tabs'
					Enabled='false'
					Location='455,6'
					Name='scroll'
					PackLocation='fff,nfn'
					PackSize='f,f'
					ScrollExtent='24,6'
					Size='24,6'
					Style='/Styles.New.scrollbar.H2.style'
				>
				</Scrollbar>
				<Page
					DropToParent='true'
					Location='11,10'
					Name='output'
					PackSize='a,a'
					RStyleDefault='/Styles.window.chat.collapsing.bg.rs_default'
					ScrollExtent='502,94'
					Size='502,94'
				>
					<Page
						BackgroundTint='#000000'
						DropToParent='true'
						Location='4,11'
						Name='body'
						PackSize='a,a'
						RStyleDefault='/Styles.window.chat.collapsing.inner.rs_default'
						ScrollExtent='496,73'
						Size='496,73'
					>
						<Text
							ContextCapable='true'
							CursorMark='52'
							CursorPoint='52'
							DragAccepts='ChatTab'
							DropToParent='true'
							Font='default_12'
							GetsInput='true'
							LocalText='1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds'
							Location='1,0'
							Margin='2,2,2,2'
							Name='text'
							PackLocation='nfn,nfn'
							PackSize='a,a'
							PalText='text1'
							ScrollExtent='484,136'
							Size='484,74'
							TextColor='#96F4FC'
							TextSelectable='false'
						>1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds1.John is a freak2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6onasdf7l;kjasdf;lkds8onasdf9l;kjasdf;lkds0onasdf1l;kjasdf;lkds2onasdf3l;kjasdf;lkds4onasdf5l;kjasdf;lkds6l;kjasdf;lkds</Text>
						<Scrollbar
							BackgroundColor='#FFFFFF'
							BackgroundTint='#42FF00'
							Control='text'
							Location='481,7'
							Name='Scroll'
							OnDisableEffector='/Effectors.FadeOut'
							OnEnableEffector='/Effectors.FadeFull'
							Opacity='0.70'
							PackLocation='fff,nfn'
							PackSize='f,a'
							ScrollExtent='12,68'
							Selectable='true'
							Size='12,68'
							Style='/Styles.scrollbar.default.vHud.style'
						>
						</Scrollbar>
					</Page>
					<Page
						BackgroundOpacity='1.00'
						Color='#00D6FB'
						GetsInput='false'
						Name='background'
						PackSize='a,a'
						PalColor='back1'
						RStyleDefault='/Styles.New.chat.big.rs_default'
						ScrollExtent='502,94'
						Size='502,94'
					/>
					<Page
						BackgroundOpacity='1.00'
						Color='#00D6FB'
						GetsInput='false'
						Name='background'
						PackSize='a,a'
						PalColor='back1'
						RStyleDefault='/Styles.New.chat.big.rs_default'
						ScrollExtent='502,94'
						Size='502,94'
					/>
				</Page>
			</Page>
		</Page>
