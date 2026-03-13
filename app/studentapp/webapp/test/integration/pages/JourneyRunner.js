sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/student/studentapp/test/integration/pages/StudentSetList",
	"com/student/studentapp/test/integration/pages/StudentSetObjectPage"
], function (JourneyRunner, StudentSetList, StudentSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/student/studentapp') + '/test/flp.html#app-preview',
        pages: {
			onTheStudentSetList: StudentSetList,
			onTheStudentSetObjectPage: StudentSetObjectPage
        },
        async: true
    });

    return runner;
});

