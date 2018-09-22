package top.macaulish.PLS.entity;

import java.sql.Timestamp;
import java.util.Objects;

public class TaskEntity {
    private int id;
    private String guid;
    private String taskname;
    private String state;
    private String targetModel;
    private Timestamp createTime;
    private Integer creatorId;
    private String savePath;
    private String saveHost;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getTargetModel() {
        return targetModel;
    }

    public void setTargetModel(String targetModel) {
        this.targetModel = targetModel;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getSaveHost() {
        return saveHost;
    }

    public void setSaveHost(String saveHost) {
        this.saveHost = saveHost;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaskEntity that = (TaskEntity) o;
        return id == that.id &&
                Objects.equals(guid, that.guid) &&
                Objects.equals(taskname, that.taskname) &&
                Objects.equals(state, that.state) &&
                Objects.equals(targetModel, that.targetModel) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(creatorId, that.creatorId) &&
                Objects.equals(savePath, that.savePath) &&
                Objects.equals(saveHost, that.saveHost);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, guid, taskname, state, targetModel, createTime, creatorId, savePath, saveHost);
    }
}
