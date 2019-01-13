SELECT isu.id,isu.name, isu.content, ms.name as mile_name , repo.name as repo_name, 
(SELECT group_concat(label.name,'-') as l_name FROM label label  inner join issue_label issue_l on issue_l.label_id=label.id  WHERE issue_l.issue_id=isu.id GROUP BY issue_l.issue_id) as lb
 FROM "issue" isu
 inner join milestone ms on ms.id=isu.milestone_id 
 inner join repository repo on repo.id=isu.repo_id 
 where isu.is_closed=0;
