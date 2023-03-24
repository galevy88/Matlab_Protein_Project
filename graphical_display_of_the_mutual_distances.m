function [] = graphical_display_of_the_mutual_distances(user_info, dis_metrix, min_max_dis)
last_row = dis_metrix(length(dis_metrix(:,1)),:);
dis_metrix = [dis_metrix; last_row];
last_col = dis_metrix(:,length(dis_metrix(1,:)));
dis_metrix = [dis_metrix last_col];
colormap(hot(256)) % custom colormap with white at the high end
pcolor(dis_metrix)
shading flat
caxis([min_max_dis.min_distance, min_max_dis.max_distance])
colorbar

foreign_atoms_name = {user_info.foreign_atoms.AtomName};
xticks(user_info.start_index_atoms)
xticklabels(user_info.resNames)
xtickangle(90)
yticks(1:length(user_info.foreign_atoms))
%yticklabels(foreign_atoms_name)
set(gca,'yticklabel', foreign_atoms_name);

xlabel(['chain: ', user_info.chain_id]) %need to check what is the name
ylabel(user_info.foreign_atoms(1).resName)
title(['file ', user_info.idcode, ' cutoff ', num2str(min_max_dis.min_distance)]);