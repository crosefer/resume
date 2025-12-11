/* Heavily borrows from the "basic-resume" template
 * Source of that template: https://github.com/stuxf/basic-typst-resume-template
 *
 * I only forked into my own template since there were a couple of formatting changes I wanted to make to adjust to the needs of my resume
*/

#let one-by-two(
  left:  "",
  right: "",
) = {[
  #left #h(1fr) #right
]}

#let two-by-two(
  top-left:  "",
  top-right: "",
  bottom-left:  "",
  bottom-right: "",
) = {[
  #top-left #h(1fr) #top-right \
  #bottom-left #h(1fr) #bottom-right
]}

#let date(
  start: "",
  end: "",
) = {
  start + " " + $dash.em$ + " " + end
}

#let contact-item(
  value,
  prefix: "",
  link-type: "",
) = {
  if value != "" {
    if link-type != "" {
      link(link-type + value)[#(prefix + value)]
    } else {
      value
    }
  }
}

#let work(
  title: "",
  dates: "",
  company: "",
) = {
  one-by-two(
    left: [#strong(title) - #company],
    right: dates,
  )
}

#let project(
  name: "",
  tech: "",
  url: "",
  date: "",
) = {
  one-by-two(
    left: {
      [*#name*, #tech #if url != "" {link("https://" + url)[_(#url)_]}]
    },
    right: {
      [#if date != "" [ #date ]]
    },
  )
}

#let education(
  school: "",
  degree: "",
  extra: "",
) = {
  if (extra != "") {
    one-by-two(
      left: strong(school),
      right: degree + emph(extra)
    )
  } else {
    one-by-two(
      left: strong(school),
      right: degree
    )
  }
  v(-5pt)
}

#let resume(
  name: "",
  pronouns: "",
  phone: "",
  email: "",
  linkedin: "",
  github: "",
  personal-website: "",
  accent-color: "#26428b",
  link-color: "#26428b",
  paper-size: "us-letter",
  font: "New Computer Modern",
  font-size: 10pt,
  name-font-size: 20pt,
  body,
) = {
  // Document Setup
  set document(author: name, title: name)
  set page(margin: 0.5in, paper: paper-size)
  set text(font: font, size: font-size, lang: "en", ligatures: false)

  // Link Styling
  show link: underline
  show link: set text(fill: rgb(link-color))

  // Heading Styling
  show heading: set text(fill: rgb(accent-color))
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(size: name-font-size, weight: 700)
    #it.body
  ]
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  [= #name]

  align(right)[
    #move(dy: -42pt)[
    #{
      let items = (
        contact-item(pronouns),
        contact-item(phone),
        contact-item(email, link-type: "mailto:"),
        contact-item(github, link-type: "https://"),
        contact-item(linkedin, link-type: "https://linkedin.com"),
        contact-item(personal-website, link-type: "https://"),
      )
      items.filter(x => x != none).join(" | ")
    }]
  ]
  v(-50pt)
  body
}

#show: resume.with(
  name: "Josef Bertolini",
  pronouns: "he/him",
  phone: "(760) 423-8168",
  email: "josefbertolini@proton.me",
  linkedin: "/in/josef-bertolini",
  name-font-size: 30pt
)

== Skills
- *Programming Languages*: C, C++, C\#, Go, Python, JavaScript, PowerShell
- *Cloud and Infrastructure*: Azure, \*NIX command Line, Scripting, Microservices, Databases
- *Tools and Frameworks*: Kusto, SQL, React, Unity, API Gateways, Grafana, Elasticsearch, Observability Tools
- *Software Development*: Object-Oriented Programming, Low-Level Systems, Testing, Debugging, Refactoring
- *Interpersonal*: Direct, Adaptable, Independent & Collaborative, Quick Learner, Supportive Team Member

== Work Experience
#work(
  title: "Software Engineer (SDE III)",
  company: "Docusign",
  dates: date(start: "August 2024", end: "Present"),
)
- Built *new ranking system* from the ground up, with precise relevance tuning and improving search result accuracy
- Led development of a *NER-powered search experience*, achieving 20% of all searches and 30% adoption in 30 days
- Coordinated a cross-team effort to deliver AI features as a *company-wide initiative* to enhance product intelligence
- *Improved observability and KPI tracking* by enhancing logs and metrics emitted by the service
- Spearheaded the migration of the *Elasticsearch Client SDK*, raising developer productivity and code maintainability
- *Resolved 90%+ of incidents* opened during on-call, *reduced false positives by \~10%* by tuning alerts
- Ensured reliability of the platform by fixing dozens of bugs, becoming a *Top 5 contributor* to the codebase

#work(
  title: "Software Development Engineer",
  company: "Microsoft",
  dates: date(start: "May 2022", end: "April 2024"),
)
- *Maintained* a critical Azure VM extension deployed on *2.5M+ VMs*, ensuring reliability and security at scale
- Delivered *support for 2 new platforms* and *automatic migration* from the legacy extension for 200k+ VMs
- Boosted extension performance with multi-threading, *reducing CPU usage* to below 5%
- Built the *testing infrastructure* (monitors, alerts, and dashboards) and *resolved 95% of incidents* as an SME
- Authored *documentation and TSGs*, reducing on-call load by an estimated 15% and accelerating issue resolution
- *Modernized the legacy codebase*, reducing technical debt and making development less error prone

#work(
  title: "Software Engineer",
  company: "Ezoic, Inc.",
  dates: date(start: "June 2021", end: "April 2022"),
)
- Owned *core repos and databases* for _LEAP_ Technologies, maintaining stability of a critical product line.
- Improved performance of _LEAP_'s backend by up to *5x*, reducing data ingestion times from days to \<24 hours
- *Integrated* *_LEAP_* *features across products* with partner teams, increasing product value and adoption
- *Implemented customer feedback* to streamline workflows and reduce friction for end users
- Led peer *reviews and debugging sessions* to improve code quality, maintainability, and knowledge share
- *Mentored new hires*, enabling them to be productive within 3 weeks and strengthening team cohesion

#work(
  title: "Teaching Staff (C & Systems Programming)",
  company: "University of California, Irvine",
  dates: date(start: "March 2021", end: "June 2021"),
)
- Designed and graded *5 programming assignments* on topics including shells, memory allocators, and networking
- Authored the *Networking Final project*, providing the protocol, library code, working client, and grading scripts
- Assisted students *debugging sessions and forum support*, improving their understanding of low-level concepts

== Projects
//#project(
//  name: "Raging Rocks",
//  tech: "Unity, C#"
//)
//- *Led gameplay and UI development* for an Angry Birds-style game, implementing core mechanics and menus
//- Streamlined prototyping by designing a *flexible power-up framework*, reducing iteration time for new features
#project(
  name: "Crux Compiler",
  tech: "Java, LLVM, ANTLR4"
)
- Built a *full-stack compiler* from ANTLR grammar definitions to LLVM IR and x64 code generation
- Implemented functions, recursion, *short-circuiting control flow*, type checking, static scoping, and shadowing
#project(
  name: "Chatroom Server",
  tech: "C",
)
- Developed a *multithread chat server* supporting an arbitrary amount of users and rooms using POSIX threads
- Implemented *thread safe generic data structures* (map, sets, vector) from scratch to support scalable concurrency
#project(
  name: "FabFlix",
  tech: "Java, JavaScript, React, SQL"
)
- Built a *full-stack e-commerce platform* with secure authentication, microservice backend, and React SPA frontend
- Enhanced scalability with an *API Gateway* abstraction and a custom ORM query builder for secure SQL generation
== Education
#education(
  school: "University of California, Irvine",
  degree: "B.S. in Computer Science, ",
  extra: "Cum Laude"
)
#education(
  school: "Georgia Institute of Technology",
  degree: "M.S. in Computer Science",
  extra: " (Expected 2027)"
)
