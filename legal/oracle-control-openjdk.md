Oracle's Control Over OpenJDK
==========

Oracle has been increasingly toxic to the developer community around Java SE. In the [Oracle Java SE Support Roadmap](https://www.oracle.com/technetwork/java/javase/documentation/eol-135779.html), Oracle defined three types of users: "Oracle Customers", "Commercial Users", and "Personal Users". Commercial Users are not Customers. In other words, Commercial Users are not paying Oracle and will only get an update approximately every six months, but no other updates. Only Customers will receive additional updates.

Developers also have additional confusion around the [Java SE Release Cadence](https://blogs.oracle.com/java-platform-group/update-and-faq-on-the-java-se-release-cadence), which indicates that new versions of Java will not be "major releases", but "feature releases". The new versions that are considered feature releases are closer to what people previously called minor version updates. Oracle specifically indicated that Java SE 9->10->11 will be closer to Java SE 8->8u20->u40, rather than Java SE 7->8->9. Note, Java SE 9 is no longer supported, SE 10 will only be supported until SE 11; for Oracle Customers only, Java SE 11 will have "Long Term Support" (LTS).

In response to the foregoing, many users have decided to switch to OpenJDK. However, Oracle has no responsibility to provide updates to OpenJDK. All IP contributed to OpenJDK is assigned to Oracle. Only an Oracle appointed OpenJDK Board Member is permitted to create and manage updates implemented in Java SE to OpenJDK. While there are some concessions that Oracle has tried to make to appease the masses, Oracle still effectively controls of OpenJDK.

## Notes

The following are notes based on various Oracle and OpenJDK documents.

## Oracle owns all IP regarding OpenJDK

To contribute to OpenJDK or become an OpenJDK Member, a person must execute the Oracle Contributor Agreement ("OCA"). The OCA requires that all of the IP rights associated with a contribution are assigned to Oracle International Corporation.

## OpenJDK Bylaws 

> The Governing Board manages the structure and operation of the Community, monitoring its health relative to the principles set forth in the Preamble.

The Governing Board has a Chair, Vice Chair, OpenJDK Lead, and two At-Large Members. Oracle appoints the Chair and OpenJDK Lead. In fact, Oracle is the only company that can appoint OpenJDK Leads. IBM appoints the Vice Chair. The two At-Large seats serve for one year and are nominated and voted upon by OpenJDK Members.

The Governing Board may add or remove seats by an Absolute Two-Thirds Majority vote. However, the GB must always have Chair, a Vice Chair, an OpenJDK Lead, and two At-Large Members. An Absolute Two-Thirds Majority vote requires twice as many Yes votes and No votes, and at least two thirds **(rounded up)** of all eligible voters vote Yes, or unanimity if there are fewer than three eligible voters.

The Governing Board is empowered to revise bylaws as well as resolve procedural disputes. However, the GB has no direct authority over technical or release decisions. Each Project has a Project Lead, and that lead has the authority over technical or release decisions. For example, **only the OpenJDK Lead (appointed by Oracle)** has the authority to make technical or release decisions for JDK Release Projects.

### OpenJDK Lead

> The OpenJDK Lead is an OpenJDK Member, appointed by Oracle, who directs the major efforts of the Community, which are new implementations of the Java SE Platform known as JDK Release Projects.

> New releases of Java SE Platform implementations are Projects. Such Projects may only be proposed by the OpenJDK Lead and may only be sponsored by the Governing Board. The OpenJDK Lead is the Project Lead for all JDK Release Projects. Every OpenJDK Member will have the opportunity to propose features for inclusion in JDK Release Projects, and decisions about which features to include will be made in a transparent manner.

[JDK 8 updates Project in OpenJDK after Java SE 8 End of Public Updates](http://mail.openjdk.java.net/pipermail/jdk8u-dev/2018-March/007341.html) indicates that Oracle doesn't plan to contribute further changes to OpenJDK 8 after Oracle stops posting public updates of SE 8 on its public download site.

### Java SE 11 is a major version with long term support

- Q7 and answer of [Java SE Release Cadence](https://blogs.oracle.com/java-platform-group/update-and-faq-on-the-java-se-release-cadence) indicates that Oracle will provide "Long Term Support" (LTS) -- at least eight additional years -- for Java SE 11. Whereas Java SE 9 has already hit its end of life. Java SE 10 will hit its end of life when Java 11 is released. Java SE 8 is the only version of Java SE that appears to have any ongoing support beyond the release of Java SE 11.

### Security Issues

Oracle created, and OpenJDK agreed to, create a [Vulnerability Group](http://openjdk.java.net/groups/vulnerability/) ("OJVG") to review vulnerability reports and fix security-related issues. The information flow defined in this document appears to provide a mechanism for an Oracle employee that is part of the OJVG to alert the OJVG if made aware of a security issue that is relevant to OpenJDK. The Oracle employee will also notify Oracle's internal security teams if OJVG becomes aware of a security issue that is relevant to Oracle's JDK aka Oracle's Java SE.

