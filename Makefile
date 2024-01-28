PORTNAME=	typescript
PORTVERSION=	5.3.3
CATEGORIES=	lang
MASTER_SITES=	https://registry.npmjs.org/typescript/-/
EXTRACT_SUFX=	.tgz

MAINTAINER=	fjachuf@gmail.com
COMMENT=	Microsoft TypeScript Compiler
WWW=		https://www.typescriptlang.org/

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		nodejs:20 tar:tgz

WRKSRC=		${WRKDIR}/package
NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/node_modules/typescript
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/lib/node_modules/typescript)
	${RLN} ${STAGEDIR}${PREFIX}/lib/node_modules/typescript/bin/tsc \
		${STAGEDIR}${PREFIX}/bin/tsc
	${RLN} ${STAGEDIR}${PREFIX}/lib/node_modules/typescript/bin/tsserver \
		${STAGEDIR}${PREFIX}/bin/tsserver

.include <bsd.port.mk>
