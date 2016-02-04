##############  BUILD VARS  ###############

DOC_ROOT=/htdocs
CODE=https://github.com/sculpin/sculpin-blog-skeleton.git
APP_NAME=alpine-sculpin
SCULPIN_INSTALL=sculpin install

############### BUILD RULES ###############
cd $DOC_ROOT
git clone $CODE $APP_NAME
cd $APP_NAME
$SCULPIN_INSTALL
