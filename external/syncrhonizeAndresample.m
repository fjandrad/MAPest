function [dataset]=syncrhonizeAndresample(dataset,refTime,originalTime)
sizeRef=length(originalTime);
if (isstruct(dataset))
    dataFieldNames=fieldnames(dataset);
    for i=1:size(dataFieldNames,1)
        if(isstruct(dataset.(dataFieldNames{i})))
            dataset.(dataFieldNames{i})= syncrhonizeAndresample(dataset.(dataFieldNames{i}),refTime,originalTime);
        else
            if  (isnumeric(dataset.(dataFieldNames{i})))
                if (isvector(dataset.(dataFieldNames{i})))
                    if(size(dataset.(dataFieldNames{i}),1)==sizeRef)
                        dataset.(dataFieldNames{i})=interp1(originalTime, dataset.(dataFieldNames{i}), refTime,'linear','extrap');
                    end
                    if(size(dataset.(dataFieldNames{i}),2)==sizeRef)
                        temp=interp1(originalTime, dataset.(dataFieldNames{i}), refTime,'linear','extrap');
                                           dataset.(dataFieldNames{i})=temp';
                    end
                else
                    if (ismatrix(dataset.(dataFieldNames{i})))
                        if(size(dataset.(dataFieldNames{i}),1)==sizeRef)
                            for columns=1:size(dataset.(dataFieldNames{i}),2)
                                dataset_temp.(dataFieldNames{i})(:,columns)=interp1(originalTime, dataset.(dataFieldNames{i})(:,columns), refTime,'linear','extrap');
                            end
                            dataset.(dataFieldNames{i})=dataset_temp.(dataFieldNames{i});
                        end
                        if(size(dataset.(dataFieldNames{i}),2)==sizeRef)
                            for rows=1:size(dataset.(dataFieldNames{i}),1)
                                dataset_temp.(dataFieldNames{i})(rows,:)=interp1(originalTime, dataset.(dataFieldNames{i})(rows,:), refTime,'linear','extrap');
                            end
                            dataset.(dataFieldNames{i})=dataset_temp.(dataFieldNames{i});
                        end
                    end
                end
            else
                if iscell(dataset.(dataFieldNames{i})) && isvector(dataset.(dataFieldNames{i}))
                    if isstruct(dataset.(dataFieldNames{i}){1})
                       for s=1:length(dataset.(dataFieldNames{i}))
                           dataset.(dataFieldNames{i}){s}=syncrhonizeAndresample(dataset.(dataFieldNames{i}){s},refTime,originalTime);
                           
                       end
                    end
                end
            end
        end
    end
end