FROM ibmcom/websphere-traditional:9.0.5.7
COPY SampleWebApp.war /work/config/SampleWebApp.war
COPY A.ear /work/config/A.ear
COPY install_app.py /work/config/install_app.py
COPY Install-SampleWebApp.py /work/config/Install-SampleWebApp.py
COPY start-SampleWebApp.py /work/config/start-SampleWebApp.py
COPY was-config.props /work/config/was-config.props
RUN env JVM_EXTRA_CMD_ARGS=-Xnoloa /work/configure.sh
#RUN /work/configure.sh
#SSL deployment#
#COPY --chown=1001:0 *.p12 /config/resources/security/
#COPY --chown=1001:0 *.p12 /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/DefaultCell01/nodes/DefaultNode01/
#COPY --chown=was:root registerTwitterSSLCertificate.py /work/config
#SSL END

#Enable basic logging#
ENV ENABLE_BASIC_LOGGING=true
#Logging End#

#COPY agent.installer.linux.gtk*.zip /work
#RUN cd /work && \
	#unzip agent.installer.linux.gtk*.zip -d /work/InstallationManagerKit && \
	#rm -rf agent.installer.linux.gtk*.zip  

#COPY 9.0.5-WS-WAS-FP008.zip /work/
#RUN /work/InstallationManagerKit/tools/imcl install com.ibm.websphere.ILAN.v90_9.0.5008.20210525_1601 -repositories /work/9.0.5-WS-WAS-FP008.zip -installationDirectory /opt/IBM/WebSphere/AppServer -dataLocation /opt/IBM/WebSphere/AppServerIMData -acceptLicense
#RUN  rm -Rf /tmp/secureStorePwd /tmp/secureStore /work/InstallationManagerKit
